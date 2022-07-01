
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/auth/api.dart';
import 'package:happytree/features/menu/menu.dart';

import '../../../components/design/design.dart';
import '../../../util/util.dart';
import '../signup/signup.dart';

class SignIn extends StatefulWidget {

  final routeName = '/signin';

  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordhide = true;
  @override
  void initState() {
    super.initState();
  }

  Widget userForm() {
    return Form(
        key: _formkey,
        child: Container(
          width: 350,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Padding(padding: EdgeInsets.only(bottom: 4),
                child: Image(image: AssetImage("asset/images/logo.png"),
                  width: 100,
                  height: 100,)),

            Padding(padding: const EdgeInsets.only(bottom: 16, top: 16),
                child: TextFormField(
                    autofillHints: const <String>[AutofillHints.username],
                    textAlign: TextAlign.center,
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Entre votre nom d'utilisateur";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        focusedBorder: setUnderlineBorder(1.5, 20.0),
                        enabledBorder: setUnderlineBorder(1.5, 20.0),
                        errorBorder: setUnderlineBorderError(2.0, 20.0),

                        border: setUnderlineBorder(1.5, 20.0),
                        hintText: "Email",
                        hintStyle: TextStyle(color:APPCOLOR2)
                    )
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 16),
              child: TextFormField(
                autofillHints: const <String>[AutofillHints.password],
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Entrer un mot de passe";
                  }
                  return null;
                },
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    focusedBorder: setUnderlineBorder(2.0, 20.0),
                    enabledBorder: setUnderlineBorder(2.0, 20.0),
                    errorBorder: setUnderlineBorderError(2.0, 20.0),
                    border: setUnderlineBorder(1.5, 25.0),
                    hintText: 'Password',
                    prefix: SizedBox(width: 50,height: 0,),
                    suffixIcon: IconButton(onPressed: () {
                      this.passwordhide = !this.passwordhide;
                      setState(() {

                      });
                    },icon: Icon(this.passwordhide ? Icons.remove_red_eye : Icons.remove_red_eye),),
                    hintStyle: TextStyle(color: APPCOLOR2)

                ),
              ),)
            ,
            Padding(padding: EdgeInsets.only(top: 4),
              child: ElevatedButton(

                style: BaseButtonRoundedColor(60, 40, Colors.redAccent),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    showSnackBar(context, "Connexion");
                    final result = await signinUser(usernameController.text, passwordController.text);
                    if(result.code == SUCCESS_CODE){
                      navigateWithName(context, Menu().routeName);
                    }
                    else{
                      showSnackBar(context, result.message);
                    }

                  } else {
                    // navigateWithName(context, Menu().routeName);
                  }
                }
                ,
                child: const Text('Se connecter'),
              ),),
            
            Padding(padding: EdgeInsets.only(top: 10), child:
            TextButton(
                onPressed: () {
                  navigateWithName(context, SignUp().routeName);
                },
                child: const Text("Pas encore inscrit ? créez vous un compte",style: TextStyle(color: APPCOLOR2),)),)

          ],
        ),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: userForm()
        )
    );
  }
}
