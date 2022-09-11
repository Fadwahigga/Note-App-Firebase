// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, sized_box_for_whitespace, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [
    {"note": " lala lala la lala lala lala la lala ", "image": "logo.png"},
    {"note": " lala lala la lala lala lala la lala ", "image": "logo.png"},
    {"note": " lala lala la lala lala lala la lala ", "image": "logo.png"},
    {"note": " lala lala la lala lala lala la lala ", "image": "logo.png"},
    {"note": " lala lala la lala lala lala la lala ", "image": "logo.png"},
    {"note": " lala lala la lala lala lala la lala ", "image": "logo.png"},
    {"note": " lala lala la lala lala lala la lala ", "image": "logo.png"}
  ];
  getuser() {
    var user = FirebaseAuth.instance.currentUser;
    // ignore: avoid_print
    print(user!.email);
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("login");
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addnotes");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, i) {
              return Dismissible(
                  // to remove notes
                  key: Key("$i"),
                  child: ListNotes(
                    notes: notes[i],
                  ));
            }),
      ),
    );
  }
}

class ListNotes extends StatelessWidget {
  final notes;
  const ListNotes({this.notes});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 1, child: Image.asset("images/logo.png", fit: BoxFit.fill)),
          Expanded(
            flex: 3,
            child: ListTile(
              title: const Text("Title"),
              subtitle: Text("${notes['note']}"),
              //subtitle:ElevatedButton(onPressed: () {}, child: const Text("Remove")),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
