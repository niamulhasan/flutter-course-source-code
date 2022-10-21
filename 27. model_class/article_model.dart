class ArticleModel {
  String? authorId;
  String? id;
  String? name;
  String? details;

  ArticleModel(Map json) {
    authorId = json["userId"].toString();
    id = (json["id"] + 1).toString();
    name = json["title"];
    details = json["body"];
  }
}
