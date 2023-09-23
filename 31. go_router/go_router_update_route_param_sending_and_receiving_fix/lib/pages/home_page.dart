import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home Page"),
            ElevatedButton(
              onPressed: () => context.goNamed(RouteNames.SECOND_PAGE,
                  queryParameters: {"naam": "Hasan"}),
              child: Text("Second Page"),
            )
          ],
        ),
      ),
    );
  }
}
