
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/features/setting_plant/setting_plant.dart';
import 'package:happytree/models/PlantType.dart';

import '../../../components/design/design.dart';
import '../../../util/util.dart';

class PlantItem extends StatefulWidget {

  final routeName = '/plantitem';
  final String plantId;

  const PlantItem({Key? key, this.plantId = ""}) : super(key: key);
  const PlantItem.withId({Key? key, required this.plantId}) : super(key: key);

  @override
  PlantItemState createState() => PlantItemState();
}

class PlantItemState extends State<PlantItem> {



  TextEditingController textEditingController = TextEditingController();

  List<PlantType> plantList = mocTypesOfPlantes;
  bool isSearching = false;
  @override
  void initState() {

    super.initState();

  }






  // Widget content() {
  //   //TODO afficher la vue
  //   return Column(
  //     children: [
  //     Padding(padding: EdgeInsets.only(top: 40, bottom: 20), child: Text("Chercher une plante", style: APPtextStyleHeader,),),
  //
  //       Padding(padding: EdgeInsets.only(bottom: 20) ,
  //       child :
  //       ElevatedButton(
  //         style: BaseButtonRoundedColorBorder(350.0, 60, APPCOLOR4, 25.0),
  //           onPressed: () {
  //       }, child: Text("Rechercher", style: TextStyle(fontSize: 30),))),
  //      Expanded(child:  ListView.builder(
  //        shrinkWrap: true,
  //        itemCount: 7,
  //        itemBuilder: (context, index) {
  //          return itemPlant(index);
  //
  //        },))
  //   ],);
  // }


  // Widget itemPlant(int index){
  //   return InkWell(
  //     onTap: (){
  //       navigateTo(context, SettingPlant.withName(plantName: "Nom de la plante "+index.toString()));
  //     },
  //     child: Row(children: [
  //     Image.asset("asset/icons/file-eye.png",width: 80, height: 80,),
  //       Container(
  //         width: 300,
  //         height: 50,
  //         padding: EdgeInsets.only(top: 10),
  //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(width: 1, color: Colors.white)),
  //         child: Text("Nom de la plante "+index.toString(), style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
  //       )
  //   ],),);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(),
        body: Center( child :Text("test")),
    );
  }
}
