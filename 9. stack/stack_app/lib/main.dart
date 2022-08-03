import 'package:flutter/material.dart';

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
        body: Center(
          child: Container(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150.0,
                      width: double.infinity,
                      color: Colors.redAccent,
                    ),
                    Container(
                      height: 150.0,
                      width: double.infinity,
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
                Center(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
