import 'package:firebase/Facebook_logi/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
final _firestor=FirebaseFirestore.instance;

 final _auth=FirebaseAuth.instance;

 String _email="";
  String _password="";
  String name="";
  String lname="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:     Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    label: Text("Enter email"),

                  ),
                  onChanged: (value){
                    setState(() {
                      _email=value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Container(
                width: 300,
                child: TextFormField(
obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",

                    label: Text("Enter Password"),

                  ),
                  onChanged: (value){
                    setState(() {
                      _password=value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "First Name",
                    label: Text("Enter first name"),

                  ),
                  onChanged: (value){
                    setState(() {
                      name=value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Last name",
                    label: Text("Enter last name"),

                  ),
                  onChanged: (value){
                    setState(() {
                      _email=value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 19,
              ),
              ElevatedButton(onPressed: ()async{
                _auth.createUserWithEmailAndPassword(email: _email, password: _password).then((signedinuser)async{
                await  _firestor.collection('users')
    .add({'email' : _email,"pass":_password,"name":name,"lname":lname})
    .then((value){
  if (signedinuser!= null){
    Navigator.pushNamed(context, '/homepage');
  }
})
    .catchError((e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${e.message}"),duration: Duration(seconds: 5),
      ));
});
}
  );




              }, child: Text("signup")),


            ],
          ),)
    );
  }
}
