import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
String _email="";
String _password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    Center(
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
          ElevatedButton(onPressed: (){
FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((FirebaseUser){
Navigator.pushNamed(context, "/homepage");
})
    .catchError((e){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$e")
  ));
});
          }, child: Text("login")),
          SizedBox(height: 19,),
          Text("Don't have account?",style: TextStyle(color: Colors.blue),),
          SizedBox(height: 19,),
          ElevatedButton(onPressed: (){
Navigator.pushNamed(context, "/signup");
          }, child: Text("signup"))
        ],
      ),)
    );
  }
}
