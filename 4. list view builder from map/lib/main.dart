import 'package:flutter/material.dart';
import 'datasource/users.dart';
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
        body: ListView.builder(
          itemCount: Users.data.length,
          itemBuilder: (BuildContext context, int i) => ListTile(
            leading: CircleAvatar(
              child: Text(Users.data[i]["id"].toString()),
            ),
            title: Text(Users.data[i]["name"]),
            subtitle: Text(Users.data[i]["email"]),
            trailing: Icon(Icons.person),
          ),
        ),
      ),
    );
  }
}
