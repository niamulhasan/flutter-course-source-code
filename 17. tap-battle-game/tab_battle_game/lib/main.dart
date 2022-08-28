import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int redScore = 50;
  int blueScore = 50;

  void redScoreUpdate() {
    setState(() {
      redScore = redScore + 1;
      blueScore = blueScore - 1;
    });
  }

  void blueScoreUpdate() {
    setState(() {
      blueScore = blueScore + 1;
      redScore = redScore - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: redScore,
                  child: InkWell(
                    onTap: redScoreUpdate,
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Expanded(
                  flex: blueScore,
                  child: InkWell(
                    onTap: blueScoreUpdate,
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            redScore >= 100 || blueScore >= 100
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.purple.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        "${redScore >= 100 ? "Red" : "Blue"} won!!",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
