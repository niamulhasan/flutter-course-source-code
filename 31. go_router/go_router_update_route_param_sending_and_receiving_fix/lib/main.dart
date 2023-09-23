import 'package:flutter/material.dart';
import 'package:go_router_new_test/route_manager.dart';

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
