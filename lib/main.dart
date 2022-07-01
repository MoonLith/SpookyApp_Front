import 'package:flutter/material.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/features/plantitem/plantitem.dart';
import 'package:happytree/features/rapport_plant/rapport_plant.dart';
import 'package:happytree/features/setting_plant/setting_plant.dart';
import 'package:happytree/features/splashscreen/splash_screen.dart';

import 'features/auth/signin/signin.dart';
import 'features/auth/signup/signup.dart';
import 'features/create/create.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {

        '/signin': (context) =>  SignIn(),
        '/signup': (context) =>  SignUp(),
        '/menu': (context) =>  Menu(),
        '/create': (context) =>  Create(),
        '/plantitem': (context) =>  PlantItem(),
        '/setting': (context) =>  ConnectionSetting(),
        '/settingplant': (context) =>  SettingPlant(),
        '/rapportplant': (context) =>  RapportPlant(),

      },

      darkTheme: ThemeData(
        // backgroundColor: Colors.red,
          brightness: Brightness.dark,
          primaryColorDark: Colors.black,
          primaryColor: Colors.black54,
          scaffoldBackgroundColor: Colors.black54

      ),
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}
