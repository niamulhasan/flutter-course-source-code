import 'package:flutter/material.dart';

import '../constaints/my_colors.dart';

class CircleButton extends StatelessWidget {
  final Widget icon;
  const CircleButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: MyColors.borderColor)),
      child: icon,
    );
  }
}
