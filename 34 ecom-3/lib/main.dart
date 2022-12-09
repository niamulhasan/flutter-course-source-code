import 'package:ecom/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider())
        ],
        child: const MaterialApp(
          title: 'Material App',
          home: LoginPage(),
        ),
      ),
    );
  }
}
