import 'dart:convert';
import 'article_model.dart';

void main() {
  String rawData = '''
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
  }
  ''';

  ArticleModel article = ArticleModel(jsonDecode(rawData));
  print(article.authorId);
  print(article.name);
}
