// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Boo"),
//         ),
//         body: Stack(
//           children: [
//             Container(
//               color: Colors.red,
//               width: 500,
//               height: 500,
//             ),
//             Positioned(
//               right: 100,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.green,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Boo"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.purple,
              )
            ],
          )),
    );
  }
}
