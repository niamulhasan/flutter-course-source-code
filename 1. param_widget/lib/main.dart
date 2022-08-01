import 'package:flutter/material.dart';

import 'widgets/list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView(
          children: [
            ListItem(color: Colors.green, text: "Boo"),
            ListItem(color: Colors.red, text: "Hello"),
            ListItem(color: Colors.blue, text: "Greetings"),
          ],
        ),
      ),
    );
  }
}
