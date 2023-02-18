import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _noteBodyTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              height: 600.0,
              child: Column(
                children: [
                  const Text("Write a note", style: TextStyle(fontSize: 40.0)),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _titleTextEditingController,
                    decoration: const InputDecoration(
                      hintText: "Tite of the note",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _noteBodyTextEditingController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: "Note Text",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  ElevatedButton(
                      onPressed: () async {
                        if (_titleTextEditingController.text.isEmpty ||
                            _noteBodyTextEditingController.text.isEmpty) {
                          return;
                        }

                        Map<String, dynamic> noteData = {
                          "title": _titleTextEditingController.text,
                          "text": _noteBodyTextEditingController.text
                        };

                        await FirebaseFirestore.instance
                            .collection("notes")
                            .add(noteData);
                      },
                      child: Text("Save Note")),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              //
              //
              //
              Map<String, dynamic> data = {
                "title": "Note title 3 form flutter app",
                "text": "note text 3 from flutter app"
              };

              var notesCollection =
                  FirebaseFirestore.instance.collection("notes");
              notesCollection.add(data);

              //
              //
            },
            child: Text("Add a note")),
      ),
    );
  }
}
