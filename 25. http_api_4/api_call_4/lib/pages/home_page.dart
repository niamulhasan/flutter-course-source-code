import 'package:api_call_3/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  final List data;

  const HomePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article App JsonPlaceholder'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(article_id: data[index]["id"].toString()),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text(data[index]["id"].toString()),
              ),
              title: Text(data[index]["title"]),
            ),
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
