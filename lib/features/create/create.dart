
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/create/api.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/features/plantitem/plantitem.dart';
import 'package:happytree/models/PlantModel.dart';
import 'package:happytree/models/PlantType.dart';
import 'package:happytree/response/plantsresponse.dart';

import '../../../components/design/design.dart';
import '../../../util/util.dart';
import '../../response/plantresponse.dart';
import '../setting_plant/setting_plant.dart';

class Create extends StatefulWidget {

  final routeName = '/create';

  const Create({Key? key}) : super(key: key);

  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {



  TextEditingController textEditingController = TextEditingController();

  List<PlantType> plantList = mocTypesOfPlantes;
  bool isSearching = false;
  bool hasResult = false;

  late PlantModel plantModel = PlantModel.init();
  @override
  void initState() {

    plantModel.id = "1";
    plantModel.name_flower = "1";
    super.initState();

  }




  Widget contentSearch(){
    return Column(children: [
      Visibility(
      visible: isSearching && !hasResult,
      child: Column(children: [
        Padding(padding: EdgeInsets.all(12), child:   Text("Chercher une plante", style: TextStyle(fontSize: 25),),),
        Text("Chercher un nom, variété ou un nom spécifique", style: TextStyle(fontSize: 16),),

      ],), ),
      Visibility(visible  : isSearching && hasResult,child: itemPlant(plantModel.name_flower ?? "", plantModel.id ?? "")),
    ],);
  }

  Widget itemPlant(String nameFlower, String plantId){
    return InkWell(
      onTap: (){
        navigateTo(context, SettingPlant.withName(plantName: nameFlower, plantId: plantId,));
      },
      child: Row(children: [
        Image.asset("asset/icons/file-eye.png",width: 40, height: 40,),
        Container(
          width: 300,
          height: 50,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(width: 1, color: Colors.white)),
          child: Text(nameFlower, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
        )
      ],),);
  }
  Widget content() {
    return Visibility(
      visible: !isSearching,
      child:  Expanded(child:
      FutureBuilder(
        future: getPlantsTypes(),
        builder: (context, AsyncSnapshot<PlantsResponse>snapshot) {

          if(snapshot.connectionState == ConnectionState.done){
            return  ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.plants!.length,
              itemBuilder: (context, index) {
                return itemPlant(snapshot.data!.plants![index].name_flower ?? "test", snapshot.data!.plants![index].id ?? "id");
              },);
          }
          else{
            return Center(child: CircularProgressIndicator(color: APPCOLOR,));
          }
      },)
      ));
  }

  Widget header(){
    return
        Column(children: [

          Visibility(
            visible: !isSearching,
            child:const Padding(
              padding: EdgeInsets.only(top: 20 ),
              child: Text("Chercher une plante", style: TextStyle(fontSize: 30, ),),),
          ),
          Padding(padding: EdgeInsets.only(top: 40,bottom: 40),
            child:  FocusScope(child: TextField(

              // focusNode: _focus,

              controller: textEditingController,

              onChanged: (value){

              },


              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.lightGreen[30],
                  focusedBorder: setOutlineBorderSearch(0.0, 25.0) ,
                  enabledBorder: setOutlineBorderSearch(0.0, 25.0) ,
                  hintText: "Rechercher",
                  prefixIcon: Icon(Icons.search, color: APPCOLOR3,),
                  suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: (){
                    textEditingController.clear();
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      isSearching = false;
                      currentFocus.unfocus();
                    }
                    // FocusManager.instance.primaryFocus?.unfocus();


                  },)
              ),),
              onFocusChange: (focus) async {
              if(focus && textEditingController.text.isNotEmpty){
                final result = await getPlantTypeByName(textEditingController.text);
                if(result.code == SUCCESS_CODE){
                  plantModel = result.payload;
                  hasResult = true;
                  setState(() {

                  });
                }
              }

              log("CLICK $focus");
              setState(() {
                isSearching = focus;
              });

            },))

        ],);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(),
        body: Column(
            children: [header(),content(), contentSearch(),],
        )
    );
  }
}
