import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String text;
  final Color color;
  const MyTitle({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Text(
        "$text",
        style: TextStyle(
            fontSize: 34.0, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
