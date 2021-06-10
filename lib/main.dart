import 'package:firebaseauth/screen2.dart';
import 'package:firebaseauth/screendash.dart';
import 'package:flutter/material.dart';

import 'modle/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

//create user instance
Userdetal userdetails = Userdetal();

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Log In"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.all(80),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.lightGreen),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Customtextfield(
                  obsvalue: false,
                  hinttext: "Email id",
                  prefixicon: Icon(Icons.email),
                  onchangevalue: (value) {
                    userdetails.email = value;
                    print(userdetails.email);
                  },
                ),
                Customtextfield(
                  obsvalue: true,
                  hinttext: "Password",
                  suffixicon: Icon(Icons.visibility),
                  prefixicon: Icon(Icons.lock),
                  onchangevalue: (value) {
                    print(value);
                  },
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      print("login method here");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Dashboard();
                      }));
                    },
                    child: Text("LOG IN")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          print("Signup code goes here");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Screen2();
                          }));
                        },
                        child: Text(
                          "Sign Up?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.red,
                              fontSize: 16),
                        )),
                    Text("for new user"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
