import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data = [];

  void loadArticles() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(data[index]["id"].toString()),
              ),
              title: Text(data[index]["title"]),
              subtitle: Text(data[index]["body"]),
            ),
          ),
          itemCount: data.length,
        ),
      ),
    );
  }
}
