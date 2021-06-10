import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  String hinttext;
  Icon prefixicon;
  Icon suffixicon;
  bool obsvalue;
  Function onchangevalue;
  Customtextfield(
      {this.obsvalue,
      this.hinttext,
      this.prefixicon,
      this.suffixicon,
      this.onchangevalue});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        obscureText: obsvalue,
        onChanged: onchangevalue,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(width: 3)),
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
        ),
      ),
    );
  }
}

class Userdetal {
  String username;
  String email;
  String password;
  Userdetal({this.username, this.email, this.password});
}
