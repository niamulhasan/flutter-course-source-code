import 'package:flutter/material.dart';

import 'widgets/list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _listItemGenerator(BuildContext context, int i) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(i.toString()),
      ),
      title: Text("Hello"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => _listItemGenerator(context, index),
        ),
      ),
    );
  }
}
