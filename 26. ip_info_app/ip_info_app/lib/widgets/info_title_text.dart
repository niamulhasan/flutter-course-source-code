import 'package:flutter/material.dart';

class InfoTitleText extends StatelessWidget {
  final text;
  const InfoTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Expanded(
        child: Text(
          "${text}",
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
