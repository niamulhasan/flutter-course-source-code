class TweetModel {
  int? id;
  String? writter;
  String? tweet;
  String? postedAt;

  TweetModel({this.id, this.writter, this.tweet, this.postedAt});

  TweetModel.fromJson(Map json) {
    id = int.parse(json["id"]);
    writter = json["author"];
    tweet = json["text"];
    postedAt = json["posted_at"];
  }

  Map<String, String> toJson() {
    Map<String, String> data = {};
    data["author"] = writter ?? "annon user";
    data["text"] = tweet ?? "empty";
    return data;
  }
}
