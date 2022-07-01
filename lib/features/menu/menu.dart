
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/components/design/design.dart';
import 'package:happytree/features/auth/signin/signin.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
import 'package:happytree/features/menu/api.dart';
import 'package:happytree/features/rapport_plant/rapport_plant.dart';
import 'package:happytree/response/plantuserresponse.dart';
import 'package:happytree/util/util.dart';

import '../create/create.dart';

class Menu extends StatefulWidget {

  final routeName = '/menu';

  const Menu({Key? key}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool passwordhide = true;
  @override
  void initState() {
    super.initState();
  }

  Widget  itemPlantCreated(String plantName, String plantlocation, String plantUserId, String plantId){
    log("PLANT ID : $plantId");
    return InkWell(child: ListTile(
      leading:  Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0), color: Colors.grey),

        child: TextButton(


          onPressed: () {

          }, child: Image.asset("asset/icons/logo-plant.png", width: 30, height: 30,), )
        ,),
      title: Text(plantName),
      trailing: IconButton(
          onPressed: () {
            navigateTo(context, RapportPlant.withName(plantName: plantName, plantLocation: plantlocation, plantUserId: plantUserId, plantId: plantId,));


          },
          icon: Image.asset("asset/icons/eye.png",width: 80, height: 80,)),),
    onTap: (){
      navigateTo(context, RapportPlant.withName(plantName: plantName, plantLocation: plantlocation, plantUserId: plantUserId, plantId: plantId,));

    },);
  }

  Widget content() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<PlantUserResponse>snapshot) {

        return ListView(children: [
          Padding(padding: EdgeInsets.only(top: 40), child:  Image.asset("asset/images/logo.png", width: 200,height: 200,),),
          Text("Ajouter une nouvelle plante", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),textAlign: TextAlign.center),
          Padding(padding: EdgeInsets.only(top: 20),
            child:    Align(child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0), color: Colors.grey),

              child: TextButton(


                onPressed: () {
                  navigateWithName(context, Create().routeName);

                }, child: Text("+",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30)), )
              ,),alignment: Alignment.center,)
          ),
          FutureBuilder(
              future: getPlantUser(),
              builder: (context,  AsyncSnapshot<PlantUserResponse>snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  log(snapshot.data?.id.toString() ?? "test");
                  final id = snapshot.data?.id;
                  if(id != null ){
                    return itemPlantCreated(snapshot.data?.plant_name ?? "",
                        snapshot.data?.plant_death.toString() ?? "",
                      snapshot.data?.id ?? "",
                      snapshot.data?.id_plant ?? ""
                    );
                  }

                  else{
                  return SizedBox(width: 0, height: 0,);
                  }

                }
                else{
                  return Padding(padding: EdgeInsets.only(top: 20),child: Center(child: CircularProgressIndicator(color: APPCOLOR,)),);
                }

              }),
          Padding(padding: EdgeInsets.only(top: 60, bottom: 20), child:  Text("Parametre de connexion", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),textAlign: TextAlign.center),),
          Padding(padding: EdgeInsets.only(top: 20), child:

          InkWell(
              onTap: () {
                navigateWithName(context, ConnectionSetting().routeName);
              },
              child: Image.asset("asset/icons/tool.png", width: 100, height: 100,))
            ,),

        ],);

      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black, automaticallyImplyLeading:  false, actions: [
          IconButton(
              onPressed: () async {

                await disconnectUser();
                navigateWithNamePop(context, SignIn().routeName);
          },
              icon: const Icon(Icons.logout))
        ]),

        body: Center(
            child: content()
        )
    );
  }
}
