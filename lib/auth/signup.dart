// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var myusername, mypassword, myemail;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail!,
          password: mypassword!,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
                  context: context,
                  title: "Erorr",
                  body: const Text("The password provided is too weak"))
              .show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
                  context: context,
                  title: "Erorr",
                  body: const Text("The account already exists for that email"))
              .show();
        }
      } catch (e) {
        print(e);
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
                        myusername = val!;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Username can't be larger than 100";
                        }
                        if (val.length < 2) {
                          return "Username can't be less than 2";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Username",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      keyboardType: TextInputType.emailAddress,
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
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Text("If You Have Account "),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("login");
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
                        var response = await signup();
                        if (response != null) {
                          Navigator.of(context).pushNamed("homepage");
                        }
                      },
                      child: const Text("Signup"),
                    ))
                  ],
                )))
      ]),
    );
  }
}
