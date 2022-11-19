import 'package:flutter/material.dart';
import 'package:routing_with_go_routuer/route_manager.dart';

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteManager.routeConfig,
      title: 'Material App',
    );
  }
}
