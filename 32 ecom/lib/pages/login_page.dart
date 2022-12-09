import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constaints/my_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _AppBarSection(),
              _LogoSection(),
              _LoginSignupFormSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Center(
        child: Image.asset(
          "assets/graphics/common/logo.png",
          width: 177.w,
        ),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection({
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

class _LoginSignupFormSection extends StatelessWidget {
  const _LoginSignupFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "example: name@email.com",
            fillColor: MyColors.inputBackground,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          "Passowrd",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Your Passowrd",
            fillColor: MyColors.inputBackground,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
        SizedBox(height: 26.0),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Login",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r))),
          ),
        ),
        SizedBox(height: 26.0),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Signup",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: MyColors.secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r))),
          ),
        )
      ],
    );
  }
}
