import 'package:flutter/material.dart';
import 'package:note_appex/Home/homepage.dart';
import 'package:note_appex/auth/login.dart';
import 'package:note_appex/auth/signup.dart';
import 'package:note_appex/proc/addnotes.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      theme: ThemeData(
          primaryColor: Colors.blue,
          buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
          textTheme: const TextTheme(
            headline6: TextStyle(color: Colors.blue),
          )),
      routes: {
        "login": (context) => const Login(),
        "signup": (context) => const Signup(),
        "homepage": (context) => const HomePage(),
        "addnotes": (context) => const AddNotes(),
      },
    );
  }
}
