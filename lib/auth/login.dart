// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mypassword, myemail;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
                  context: context,
                  title: "Erorr",
                  body: const Text("No user found for that email"))
              .show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
                  context: context,
                  title: "Erorr",
                  body: const Text("Wrong password provided for that user"))
              .show();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Center(
          child: Image.asset(
            "images/logo.png",
            width: 100,
            height: 100,
          ),
        ),
        Container(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        myemail = val!;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Email can't be larger than 100";
                        }
                        if (val.length < 2) {
                          return "Email can't be less than 2";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        mypassword = val!;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Password can't be larger than 100";
                        }
                        if (val.length < 2) {
                          return "Password can't be less than 2";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Text("If You Havan't Account "),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: Text(
                              "Click Here",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        ],
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                        child: ElevatedButton(
                      onPressed: () async {
                        var response = await login();
                        if (response != null) {
                          Navigator.of(context)
                              .pushReplacementNamed("homepage");
                        }
                      },
                      child: const Text("Login"),
                    ))
                  ],
                )))
      ]),
    );
  }
}
