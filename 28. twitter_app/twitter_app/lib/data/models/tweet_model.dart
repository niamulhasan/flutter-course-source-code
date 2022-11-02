class TweetModel {
  int? id;
  String? writter;
  String? tweet;
  String? postedAt;

  TweetModel.fromJson(Map json) {
    id = int.parse(json["id"]);
    writter = json["author"];
    tweet = json["text"];
    postedAt = json["posted_at"];
  }
}
