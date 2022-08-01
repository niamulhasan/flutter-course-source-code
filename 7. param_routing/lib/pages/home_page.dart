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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SecondPage(name: "Hello"),
                    ),
                  );
                },
                child: Text("Go To 2nd Page with Hello"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SecondPage(name: "Hi"),
                    ),
                  );
                },
                child: Text("Go To 2nd Page with Hi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
