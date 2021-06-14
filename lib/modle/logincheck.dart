import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool checkifuserlogin() {
  var currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser != null) {
    print(currentUser.uid);
    return true;
  } else {
    print("user is null");
    return false;
  }
}
