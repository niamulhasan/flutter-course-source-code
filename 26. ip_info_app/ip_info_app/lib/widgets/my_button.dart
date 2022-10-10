import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final icon;
  const MyButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color(0xff886AE2),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                "${text}",
                style: TextStyle(color: Color(0xff481E71), fontSize: 18.0),
              ),
              SizedBox(width: 8.0),
              icon,
            ],
          ),
        ));
  }
}
