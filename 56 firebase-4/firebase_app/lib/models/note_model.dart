class NoteModel {
  String id;
  String? title;
  String? text;

  NoteModel({required this.id, this.title, this.text});

  NoteModel.fromFirebase(Map<String, dynamic> json, this.id) {
    title = json["title"];
    text = json["text"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "text": text,
    };
  }
}
