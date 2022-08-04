import 'package:flutter/material.dart';

class FeatureValueText extends StatelessWidget {
  final String text;
  const FeatureValueText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "$text",
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
