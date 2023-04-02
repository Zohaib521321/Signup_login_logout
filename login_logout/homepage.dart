import 'package:firebase/Facebook_logi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class homeage extends StatefulWidget {
  const homeage({Key? key}) : super(key: key);

  @override
  State<homeage> createState() => _homeageState();
}

class _homeageState extends State<homeage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
     Center(
child:     Column(
  mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text("now you are login"),
      SizedBox(height: 19,),
         TextButton(onPressed: (){
FirebaseAuth.instance.signOut()
    .then((value){
Navigator.pushNamed(context, "/login");
    })
    .catchError((e){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$e")
  ));
    });

         }, child: Text("Logout")),
         // Text("name is widget.$na email is $_email and last name is $lname "),
       ],
     ),
     ) );
  }
}
