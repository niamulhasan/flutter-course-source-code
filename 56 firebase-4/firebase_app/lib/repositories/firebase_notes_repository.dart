import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/note_model.dart';

abstract class FirebaseNoteRepository {
  static Future<void> saveNote(NoteModel note) async {
    if (note.title == null || note.text == null) {
      return;
    }
    if (note.title!.isEmpty || note.text!.isEmpty) {
      return;
    }
    await FirebaseFirestore.instance.collection("notes").add(note.toJson());
  }

  static Stream<List<NoteModel>> getNotes() {
    return FirebaseFirestore.instance.collection("notes").snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => NoteModel.fromFirebase(doc.data(), doc.id))
              .toList(),
        );
  }

  static Future<void> deleteNote(NoteModel note) async {
    await FirebaseFirestore.instance.collection("notes").doc(note.id).delete();
  }

  static Future<void> updateNote(NoteModel note) async {
    Map<String, dynamic> noteData = {"title": note.title, "text": note.text};
    print(noteData);
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(note.id)
        .update(noteData);
  }
}
