import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                http.Response res = await http.get(
                    Uri.parse("https://jsonplaceholder.typicode.com/posts"));
                print(res.body);
              },
              child: Text("Load Posts")),
        ),
      ),
    );
  }
}
