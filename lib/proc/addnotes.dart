// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  maxLength: 30,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Title Note",
                      prefixIcon: Icon(Icons.note)),
                ),
                TextFormField(
                  maxLength: 200,
                  minLines: 1,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Note",
                      prefixIcon: Icon(Icons.note)),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showbottomsheet();
                      });
                    },
                    child: const Text("Add Image")),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Add Note",
                        style: TextStyle(fontSize: 25),
                      )),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  showbottomsheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Please Choose Image",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  InkWell(
                    onTap: (() {}),
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.photo),
                            SizedBox(width: 10),
                            Text("From Gallery"),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: (() {}),
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(Icons.camera),
                            SizedBox(width: 10),
                            Text("From Camera"),
                          ],
                        )),
                  ),
                ],
              ));
        });
  }
}
