import 'package:firebase_app/models/note_model.dart';
import 'package:firebase_app/repositories/firebase_notes_repository.dart';
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
                      onPressed: () => FirebaseNoteRepository.saveNote(
                          NoteModel(
                              id: "00",
                              title: _titleTextEditingController.text,
                              text: _noteBodyTextEditingController.text)),
                      child: Text("Save Note")),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseNoteRepository.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error Loading Data"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading"));
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
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
                          snapshot.data?[index].title ?? 'Not title',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          snapshot.data?[index].text ?? "No Text",
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _titleTextEditingController.text =
                                snapshot.data?[index].title ?? "No Title";
                            _noteBodyTextEditingController.text =
                                snapshot.data?[index].text ?? "No Text";
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
                                        onPressed: () =>
                                            FirebaseNoteRepository.updateNote(
                                              NoteModel(
                                                  id: snapshot.data![index].id,
                                                  title:
                                                      _titleTextEditingController
                                                          .text,
                                                  text:
                                                      _noteBodyTextEditingController
                                                          .text),
                                            ),
                                        child: Text("Save Changes")),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => FirebaseNoteRepository.deleteNote(
                              snapshot.data![index]),
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
