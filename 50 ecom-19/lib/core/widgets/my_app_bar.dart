import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello welcome",
              style: TextStyle(fontSize: 14.sp),
            ),
            Text(
              "Lets Login or Signup",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/graphics/common/avater.png"),
        )
      ],
    );
  }
}
