import 'dart:convert';

import 'package:http/http.dart' as http;

class TweetDatasource {
  static Future<List> getAllTweets() async {
    http.Response response = await http
        .get(Uri.parse("https://634efafddf22c2af7b485337.mockapi.io/tweet"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return [{}];
  }
}
