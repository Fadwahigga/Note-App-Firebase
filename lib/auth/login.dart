import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Username",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: "Password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
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
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("homepage");
                  },
                  child: const Text("Login"),
                ))
              ],
            )))
      ]),
    );
  }
}
