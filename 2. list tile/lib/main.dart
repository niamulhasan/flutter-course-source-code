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
          children: const [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("RM"),
              ),
              title: Text("Rahim Mia"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("KM"),
              ),
              title: Text("Karim Mia"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("AA"),
              ),
              title: Text("Akkas Ali"),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
