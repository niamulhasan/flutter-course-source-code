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

  Future<void> _saveNote() async {
    if (_titleTextEditingController.text.isEmpty ||
        _noteBodyTextEditingController.text.isEmpty) {
      return;
    }
    Map<String, dynamic> noteData = {
      "title": _titleTextEditingController.text,
      "text": _noteBodyTextEditingController.text
    };
    await FirebaseFirestore.instance.collection("notes").add(noteData);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _getNotes() {
    return FirebaseFirestore.instance.collection("notes").snapshots();
  }

  Future<void> _deleteNote(String id) async {
    await FirebaseFirestore.instance.collection("notes").doc(id).delete();
  }

  Future<void> _updateNote(String id) async {
    Map<String, dynamic> noteData = {
      "title": _titleTextEditingController.text,
      "text": _noteBodyTextEditingController.text
    };
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(id)
        .update(noteData);
  }

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
                      onPressed: _saveNote, child: Text("Save Note")),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: _getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error Loading Data"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading"));
          }
          return ListView.builder(
            itemCount: snapshot.data?.size ?? 0,
            itemBuilder: (context, int index) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.docs[index]["title"],
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          snapshot.data!.docs[index]["text"],
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _titleTextEditingController.text =
                                snapshot.data!.docs[index]["title"];
                            _noteBodyTextEditingController.text =
                                snapshot.data!.docs[index]["text"];
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                padding: const EdgeInsets.all(12.0),
                                width: double.infinity,
                                height: 600.0,
                                child: Column(
                                  children: [
                                    const Text("Edit Note",
                                        style: TextStyle(fontSize: 40.0)),
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
                                      controller:
                                          _noteBodyTextEditingController,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        hintText: "Note Text",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    ElevatedButton(
                                        onPressed: () => _updateNote(
                                            snapshot.data!.docs[index].id),
                                        child: Text("Save Changes")),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () =>
                              _deleteNote(snapshot.data!.docs[index].id),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
