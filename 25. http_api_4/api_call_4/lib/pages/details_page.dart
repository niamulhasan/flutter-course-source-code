import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  final String article_id;

  DetailsPage({super.key, required this.article_id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Map article = {};

  Future<void> getArticle() async {
    http.Response res = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/${widget.article_id}"));

    setState(() {
      article = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    super.initState();

    getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${article["title"]}"),
      ),
      body: Center(
        child: Text("${article["body"]}"),
      ),
    );
  }
}
