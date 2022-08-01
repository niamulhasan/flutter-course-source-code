import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Color color;
  final String text;
  const ListItem({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 120.0,
        width: double.infinity,
        color: color,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
