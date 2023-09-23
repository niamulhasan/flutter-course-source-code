import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../route_manager.dart';

class SecondPage extends StatelessWidget {
  final String name;
  const SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Second Page Param Value: $name"),
            ElevatedButton(
                onPressed: () => context.goNamed(RouteNames.THIRD_PAGE),
                child: Text("Go to Third Page"))
          ],
        ),
      ),
    );
  }
}
