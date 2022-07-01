
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/auth/api.dart';
import 'package:happytree/features/auth/signin/signin.dart';

import '../../../components/design/design.dart';
import '../../../util/util.dart';

class SignUp extends StatefulWidget {

  final routeName = '/signup';

  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool condition = false;
  @override
  void initState() {
    super.initState();
  }

  Widget userForm() {
    return  Form(
        key: _formkey,
        child: Container( width : 350,child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Padding(padding: EdgeInsets.only(left: 20), child: Align(child:  Text("SignUp",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white), ),alignment: Alignment.center),
            ),
            Padding(padding: const  EdgeInsets.only(bottom: 16, top: 16),
                child:
                TextFormField(

                  autofillHints: const <String>[AutofillHints.email],
                  textAlign: TextAlign.center,
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Entrer votre nom d'utilisateur";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: setUnderlineBorder(1.5, 20.0),
                    enabledBorder: setUnderlineBorder(1.5, 20.0),
                    border: setUnderlineBorder(1.5, 20.0),
                    hintText: "Nom d'utilisateur",
                  ),
                )),
            Padding(padding: const  EdgeInsets.only(bottom: 16, top: 16),
                child:
                TextFormField(

                  autofillHints: const <String>[AutofillHints.email],
                  textAlign: TextAlign.center,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Entrer votre adresse email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: setUnderlineBorder(1.5, 20.0),
                    enabledBorder: setUnderlineBorder(1.5, 20.0),
                    border: setUnderlineBorder(1.5, 20.0),
                    hintText: "Adresse email",
                  ),
                )),
            Padding(
              padding: const  EdgeInsets.only(bottom: 16, top: 16),
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
                  focusedBorder: setUnderlineBorder(1.5, 20.0),
                  enabledBorder: setUnderlineBorder(1.5, 20.0),
                  border: setUnderlineBorder(1.5, 20.0),
                  hintText: 'Password',
                ),
              ),)
            ,

            Padding(padding: EdgeInsets.only(top: 40, bottom: 20),
              child: ElevatedButton(
                style: BaseButtonRoundedColor(320, 40, APPCOLOR2),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    showSnackBar(context, "Connexion");
                    final result = await signUpUSer(usernameController.text, passwordController.text, emailController.text);
                    if(result.code == SUCCESS_CODE){
                      showSnackBar(context, "Inscription réalisée");
                      navigateWithNamePop(context, SignIn().routeName);

                    }
                    else{
                      showSnackBar(context, "Une erreur est survenue");

                    }
                  }
                  else {
                  }
                },
                child: const Text("Continue"),
              ),),
          ],
        ),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,),

        body: Center( child :userForm())
    );
  }
}
