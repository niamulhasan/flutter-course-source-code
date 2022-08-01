import 'package:flutter/material.dart';
import 'package:routing_app/pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SecondPage(),
                ),
              );
            },
            child: Text("Go To 2nd Page"),
          ),
        ),
      ),
    );
  }
}
