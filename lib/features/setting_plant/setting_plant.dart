
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/features/setting_plant/api.dart';
import 'package:happytree/util/util.dart';

import '../../components/design/design.dart';
import '../create/create.dart';

class SettingPlant extends StatefulWidget {

  final routeName = '/settingplant';
  final plantName;
  final String plantId;
  const SettingPlant({Key? key, this.plantName = "", this.plantId = ""}) : super(key: key);
  const SettingPlant.withName({Key? key, required this.plantName, required this.plantId }) : super(key: key);

  @override
  SettingPlantState createState() => SettingPlantState();
}

class SettingPlantState extends State<SettingPlant> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String dropdownValue = "Chambre";
  @override
  void initState() {
    super.initState();
  }

  Widget content() {
        return Column(

          children: [

          Padding(
              padding: EdgeInsets.only(top: 40, bottom: 0),
              child: Text(widget.plantName, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),)),
          Padding(padding: EdgeInsets.only(top: 20,bottom: 20),
            child: InkWell(
              onTap: () {
                // navigateWithName(context, Create().routeName);

              },
              child: Image.asset("asset/icons/logo-plant.png", width: 150, height: 150,), )
            ,),

          // Padding(padding: EdgeInsets.only(top: 5, bottom: 20), child:  Text("Ajouter une photo", textAlign : TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),),
          Align(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // Image.asset("asset/icons/form.png", width: 60, height: 60,),
              Text("Formulaire", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)]),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:           Padding(padding: EdgeInsets.only(top: 20), child: Text("Prénom de la plante :", style: TextStyle(fontSize: 15),),),
          ),

          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                enabledBorder: setUnderlineBorderColor(3.0, 1.0, Colors.white),
              focusedBorder: setUnderlineBorderColor(3.0, 1.0, Colors.white)
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child:           Padding(padding: EdgeInsets.only(top: 30), child: Text("Emplacement :", style: TextStyle(fontSize: 15),),),
          // ),

          // Align(child:  Padding(padding: EdgeInsets.only(top: 30, bottom: 40),
          //   child: Container(
          //     width: 200,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: Colors.white)),
          //     child:  DropdownButton<String>(
          //
          //         value: dropdownValue,
          //
          //         style: TextStyle(color: Colors.white),
          //         items: <String>['Chambre', 'Salon', 'Balcon', 'Terasse']
          //             .map<DropdownMenuItem<String>>((String value) {
          //           return DropdownMenuItem<String>(
          //
          //             value: value,
          //             child: Text(value,style: TextStyle(color: Colors.white),),
          //           );
          //         }).toList(),
          //         onChanged: (String? value){
          //           dropdownValue = value!;
          //           setState(() {
          //
          //           });
          //         }),),),),
         Padding(padding: EdgeInsets.only(top :20, bottom: 20), child:  Align(child: ElevatedButton(

             style: BaseButtonRoundedColorBorder(200, 50, APPCOLOR4, 25.0),
             onPressed: ()  async {
               final title = textEditingController.text;
               log(title);

               saveNewTree(title, widget.plantName,dropdownValue);
               final result = await createPlante(title, widget.plantId);
               if(result.code == SUCCESS_CODE){
                 showSnackBar(context, result.message);
                 navigateWithNamePop(context, Menu().routeName);
               }
               else{
                 showSnackBar(context, "Une erreur est survenue");
               }

             }, child: Text("Enregistrer", style: TextStyle(fontSize: 20),)),), )


        ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset : false,
        appBar: AppBar(),

        body: Center(
            child: content()
        )
    );
  }
}
