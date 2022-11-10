import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twitter_app/data/models/tweet_model.dart';

class TweetDatasource {
  static Future<List<TweetModel>> getAllTweets() async {
    List<TweetModel> tweetList = [];

    http.Response response = await http
        .get(Uri.parse("https://634efafddf22c2af7b485337.mockapi.io/tweet"));

    if (response.statusCode == 200) {
      List parsedJson = jsonDecode(response.body);

      parsedJson.forEach((tweet) {
        tweetList.add(TweetModel.fromJson(tweet));
      });
    }
    return tweetList;
  }

  static Future<bool> postTweet(TweetModel tweetModel) async {
    http.Response response = await http.post(
      Uri.parse("https://634efafddf22c2af7b485337.mockapi.io/tweet"),
      body: tweetModel.toJson(),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
