
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/util/util.dart';

import '../../components/design/design.dart';
import '../create/create.dart';

class ConnectionSetting extends StatefulWidget {

  final routeName = '/setting';

  const ConnectionSetting({Key? key}) : super(key: key);

  @override
  ConnectionSettingState createState() => ConnectionSettingState();
}

class ConnectionSettingState extends State<ConnectionSetting> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordhide = true;
  @override
  void initState() {
    super.initState();
  }

  Widget content() {
    return FutureBuilder(builder: (context, snapshot) {
      if(snapshot.hasData){
        return Text("Data");
      }
      else{
        return Column(children: [
          Padding(padding: EdgeInsets.only(top: 40), child:  Image.asset("asset/images/logo.png", width: 200,height: 200,),),

          Padding(padding: EdgeInsets.only(top: 60, bottom: 40), child:  Text("Parametre de connexion", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),),
          Icon(Icons.wifi, size: 60),
          Padding(padding: EdgeInsets.only(top: 40), child:
          ElevatedButton(
              onPressed: () {

              },
              style: BaseButtonRoundedColorBorder(250, 50, APPCOLOR4,25.0),
              child: Text("Paramètre Wifi",style: TextStyle(fontSize: 30),))
            ,),

        ],);
      }

    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),

        body: Center(
            child: content()
        )
    );
  }
}
