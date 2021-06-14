import 'package:flutter/material.dart';

import 'modle/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Userdetal userdetail = Userdetal();

class Screen2 extends StatefulWidget {
  Screen2({Key key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("SIGN UP"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Customtextfield(
                    obsvalue: false,
                    hinttext: "User name",
                    prefixicon: Icon(Icons.verified_user),
                    onchangevalue: (value) {
                      print(value);
                      userdetail.username = value;
                    },
                  ),
                  Customtextfield(
                    obsvalue: false,
                    hinttext: "Email Id",
                    prefixicon: Icon(Icons.email),
                    onchangevalue: (value) {
                      print(value);
                      userdetail.email = value;
                    },
                  ),
                  Customtextfield(
                    hinttext: "Password",
                    prefixicon: Icon(Icons.lock),
                    obsvalue: true,
                    suffixicon: Icon(Icons.visibility),
                    onchangevalue: (value) {
                      print(value);
                      userdetail.password = value;
                    },
                  ),
                  Customtextfield(
                    hinttext: "Verify password",
                    prefixicon: Icon(Icons.lock),
                    obsvalue: true,
                    suffixicon: Icon(Icons.visibility),
                    onchangevalue: (value) {
                      print(value);
                      if (value != userdetail.password) {
                        print("Error in password verification");
                      }
                    },
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print("Executing code for signup goes here");
                        try {
                          await auth.createUserWithEmailAndPassword(
                              email: userdetail.email,
                              password: userdetail.password);
                        } catch (e) {
                          print("Error occured is $e");
                        }
                      },
                      child: Text("SIGN UP")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
