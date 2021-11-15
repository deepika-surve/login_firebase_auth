import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class Service {
  final auth = FirebaseAuth.instance;
  loginUser(email, password, context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }
    catch (e) {
      print(e);
    }
  }
  error(context, e) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(e),
        content: Text(e.toString()),
      );
    });
  }
}