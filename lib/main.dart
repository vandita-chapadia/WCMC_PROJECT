import 'package:flutter/material.dart';
import 'home.dart';
import 'Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SLogin.dart';
import 'SSignUp.dart';
import 'Start.dart';
import 'SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home:

      HomePage(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "SLogin": (BuildContext context)=>SLogin(),
        "SSignUp": (BuildContext context)=>SSignUp(),
        "start":(BuildContext context)=>Start(),
      },

    );
  }

}