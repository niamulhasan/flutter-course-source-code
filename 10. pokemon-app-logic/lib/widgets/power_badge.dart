import 'package:flutter/material.dart';

class PowerBadge extends StatelessWidget {
  final String text;
  const PowerBadge({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.0),
        color: Colors.white.withOpacity(0.3),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      margin: EdgeInsets.symmetric(vertical: 3.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
