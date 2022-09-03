import 'package:flutter/material.dart';
import 'package:tic_tac_toe/enums/box_state.dart';
import 'package:tic_tac_toe/enums/game_state.dart';

import 'widgets/box_state_to_icon.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCrossTurn = true;
  GameState gameState = GameState.gameIsNotFinished;

  // first row
  BoxState a = BoxState.empty;

  BoxState b = BoxState.empty;

  BoxState c = BoxState.empty;

  // second row
  BoxState d = BoxState.empty;

  BoxState e = BoxState.empty;

  BoxState f = BoxState.empty;

  // third row
  BoxState g = BoxState.empty;

  BoxState h = BoxState.empty;

  BoxState i = BoxState.empty;

  void resetGame() {
    setState(() {
      // first row
      a = BoxState.empty;

      b = BoxState.empty;

      c = BoxState.empty;

      // second row
      d = BoxState.empty;

      e = BoxState.empty;

      f = BoxState.empty;

      // third row
      g = BoxState.empty;

      h = BoxState.empty;

      i = BoxState.empty;

      //rest gamestate
      gameState = GameState.gameIsNotFinished;
    });
  }

  void gameScoreUpdate() {
    //first row
    if (a == b && b == c && a != BoxState.empty) {
      if (a == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }

    //second row
    if (d == e && e == f && d != BoxState.empty) {
      if (d == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }

    //third row
    if (g == h && h == i && g != BoxState.empty) {
      if (g == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }

    //first column
    if (a == d && d == g && a != BoxState.empty) {
      if (a == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }

    //second column
    if (b == e && e == h && b != BoxState.empty) {
      if (b == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }

    //third column
    if (c == f && f == i && c != BoxState.empty) {
      if (c == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }

    //right slope
    if (a == e && e == i && a != BoxState.empty) {
      if (a == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }

    //left slope
    if (c == e && e == g && c != BoxState.empty) {
      if (c == BoxState.circle) {
        gameState = GameState.circleWon;
      } else {
        gameState = GameState.crossWon;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Turn: ${isCrossTurn ? "Cross" : "Circle"}",
                      style: TextStyle(fontSize: 44.0),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: GridView.count(
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                    crossAxisCount: 3,
                    children: [
                      //first row
                      InkWell(
                        onTap: () {
                          print("a tapped");
                          setState(() {
                            if (a == BoxState.empty) {
                              if (isCrossTurn) {
                                a = BoxState.cross;
                              } else {
                                a = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: a),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("b tapped");
                          setState(() {
                            if (b == BoxState.empty) {
                              if (isCrossTurn) {
                                b = BoxState.cross;
                              } else {
                                b = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: b),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("c tapped");
                          setState(() {
                            if (c == BoxState.empty) {
                              if (isCrossTurn) {
                                c = BoxState.cross;
                              } else {
                                c = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(
                            boxState: c,
                          ),
                        ),
                      ),

                      //second row
                      InkWell(
                        onTap: () {
                          print("d tapped");
                          setState(() {
                            if (d == BoxState.empty) {
                              if (isCrossTurn) {
                                d = BoxState.cross;
                              } else {
                                d = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: d),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("e tapped");
                          setState(() {
                            if (e == BoxState.empty) {
                              if (isCrossTurn) {
                                e = BoxState.cross;
                              } else {
                                e = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: e),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("f tapped");
                          setState(() {
                            if (f == BoxState.empty) {
                              if (isCrossTurn) {
                                f = BoxState.cross;
                              } else {
                                f = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: f),
                        ),
                      ),

                      //third row
                      InkWell(
                        onTap: () {
                          print("g tapped");
                          setState(() {
                            if (g == BoxState.empty) {
                              if (isCrossTurn) {
                                g = BoxState.cross;
                              } else {
                                g = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: g),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("h tapped");
                          setState(() {
                            if (h == BoxState.empty) {
                              if (isCrossTurn) {
                                h = BoxState.cross;
                              } else {
                                h = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: h),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("i tapped");
                          setState(() {
                            if (i == BoxState.empty) {
                              if (isCrossTurn) {
                                i = BoxState.cross;
                              } else {
                                i = BoxState.circle;
                              }
                              isCrossTurn = !isCrossTurn;
                              gameScoreUpdate();
                            }
                          });
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: BoxStateToIcon(boxState: i),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gameState != GameState.gameIsNotFinished
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.greenAccent.withOpacity(0.9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "${gameState == GameState.circleWon ? "Circle" : "Cross"}Won",
                            style: TextStyle(fontSize: 44.0),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => resetGame(), child: Text("Reset"))
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
