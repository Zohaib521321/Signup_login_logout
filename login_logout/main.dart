import 'package:firebase/login_logout/homepage.dart';
import 'package:firebase/login_logout/login.dart';
import 'package:firebase/login_logout/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(apiKey: "api_key",
          appId: "appID",
          messagingSenderId: "senderid",
          projectId: "",
          storageBucket: "",
          databaseURL: "",
          measurementId: "",

        )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: signup(),
routes: <String,WidgetBuilder>{
        "/landingpage":(BuildContext context)=>MyApp(),
  "/login":(BuildContext context)=>signup(),
  "/signup":(BuildContext context)=>login(),
  "/homepage":(BuildContext context)=>homeage(),
},
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the home screen!'),
      ),
    );
  }
}
