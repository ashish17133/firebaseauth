import 'package:flutter/material.dart';

import 'modle/model.dart';

class Screen2 extends StatefulWidget {
  Screen2({Key key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  ),
                  Customtextfield(
                    obsvalue: false,
                    hinttext: "Email Id",
                    prefixicon: Icon(Icons.email),
                  ),
                  Customtextfield(
                    hinttext: "Password",
                    prefixicon: Icon(Icons.lock),
                    obsvalue: true,
                    suffixicon: Icon(Icons.visibility),
                  ),
                  Customtextfield(
                    hinttext: "Verify password",
                    prefixicon: Icon(Icons.lock),
                    obsvalue: true,
                    suffixicon: Icon(Icons.visibility),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Code for signup goes here");
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
