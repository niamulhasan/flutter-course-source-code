import 'package:flutter/material.dart';
import 'package:routing_app/pages/details_page.dart';

import 'pages/home_page.dart';
import 'widgets/pokemon_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
