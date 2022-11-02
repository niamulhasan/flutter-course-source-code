import 'package:flutter/material.dart';
import 'package:twitter_app/data/datasources/tweet_datasource.dart';
import 'package:twitter_app/data/models/tweet_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TweetDatasource.getAllTweets(),
      builder: (BuildContext context, AsyncSnapshot sn) {
        if (sn.hasError) {
          return Text("Error Loading Data ${sn.error}");
        }
        if (sn.hasData) {
          List<TweetModel> tweets = sn.data;
          return ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                    leading: CircleAvatar(),
                    title: Text("${tweets[index].writter}"),
                    subtitle: Text("${tweets[index].tweet}"),
                  ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );

    // return ListView.builder(
    //   itemCount: 10,
    //   itemBuilder: (BuildContext context, int index) => Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: ListTile(
    //       leading: CircleAvatar(
    //         backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
    //       ),
    //       title: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text("Rahim Molla"),
    //           Text(
    //             "2022-10-18T17:51:54.841Z",
    //             style: TextStyle(fontSize: 12.0),
    //           ),
    //         ],
    //       ),
    //       subtitle: Text(
    //           "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis"),
    //     ),
    //   ),
    // );
  }
}
