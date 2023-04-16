import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_aventure/utils/size.dart';
import 'package:game_aventure/widget/buttons/game_button.dart';
import 'package:game_aventure/widget/cellion.dart/cellion_widget.dart';
import 'package:game_aventure/widget/gargoyle/gargoyle.dart';
import 'package:game_aventure/widget/windrider/windrider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // *******  gargolyne
  int gargoyleCount = 1;
  double gargoylePosx = 0.5;
  String gargolyneDirection = 'left';

  // *******  cellion
  int cellionCount = 1;
  double cellionPosx = 0;
  String cellionDirection = 'right';

  // *******  windrider
  int windriderCount = 2;
  double windriderPosx = -0.5;
  double windriderPosY = 1;
  String windriderDirection = 'right';
  int attackWindriderCount = 0;

//******* Loading screem
  var loadingScreenColor = Colors.grey[800];
  var loadingScreenText = Colors.black;
  int loadingTimer = 3;
  // add
  // bool gameHasStarted = false;

  // ******* attack
  double attackX = 2;
  double attackY = 2;
  int attackSprite = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment(gargoylePosx, 1),
                    child: GargoyleWidget(
                        gargoyleCount: gargoyleCount,
                        gargolyneDirection: gargolyneDirection),
                  ),
                  Container(
                    alignment: Alignment(cellionPosx, 1),
                    child: CellionWidget(
                      cellionCount: cellionCount,
                      cellionDirection: cellionDirection,
                    ),
                  ),
                  Container(
                    alignment: Alignment(windriderPosx, windriderPosY),
                    child: WindriderWidget(
                        windriderCount: windriderCount % 2 + 1,
                        windriderDirection: windriderDirection,
                        attackWindriderCount: attackWindriderCount),
                  ),
                  Container(
                    color: loadingScreenColor,
                    child: Center(
                      child: (loadingScreenText != Colors.transparent)
                          ? SizedBox(
                              width: double.infinity,
                              height: sizeHeight(context) * 0.4,
                              // color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Game OHTT',
                                    style: TextStyle(
                                      color: loadingScreenText,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          sizeWidth(context) / 100 * (11 / 3),
                                    ),
                                  ),
                                  Text(
                                    loadingTimer.toString(),
                                    style: TextStyle(
                                      color: loadingScreenText,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          sizeWidth(context) / 100 * (13 / 3),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      'On Tap For Play',
                                      style: TextStyle(
                                        color: loadingScreenText,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            sizeWidth(context) / 100 * (11 / 3),
                                      ),
                                    ),
                                    onTap: () {
                                      startGame();
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment(windriderPosx, windriderPosY),
                  //   child: WindriderWidget(
                  //       windriderCount: windriderCount % 2 + 1,
                  //       windriderDirection: windriderDirection,
                  //       attackWindriderCount: attackWindriderCount),
                  // ),
                ],
              ),
            ),
          ),
          Container(
            height: sizeHeight(context) * 0.01, //tamano de 10 px
            color: Colors.green,
          ),
          Expanded(
            child: Container(
              color: Colors.grey[500],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'G A M E O H T T',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GameButton(
                        // text: 'ATTACK',
                        icon: const Icon(Icons.air_rounded),
                        onTap: () {
                          print('ATTACK');
                          attack();
                        },
                      ),
                      GameButton(
                        icon: const Icon(Icons.arrow_back),
                        onTap: () {
                          print('LEFT');
                          moveLeft();
                        },
                      ),
                      GameButton(
                        icon: const Icon(Icons.arrow_upward),
                        onTap: () {
                          print('JUMP');
                          moveJump();
                        },
                      ),
                      GameButton(
                        icon: const Icon(Icons.arrow_forward_sharp),
                        onTap: () {
                          print('RIGHT');
                          moveRight();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void startGame() {
    startGameTimer();
    moveGargoyle();
    moveCellion();
    // attack();
  }

  void moveGargoyle() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      setState(() {
        gargoyleCount++;

        if (gargolyneDirection == 'left') {
          gargoylePosx -= 0.01;
        } else {
          gargoylePosx += 0.01;
        }
        if (gargoylePosx < 0.3) {
          gargolyneDirection = 'right';
        } else if (gargoylePosx > 0.6) {
          gargolyneDirection = 'left';
        }
        if (gargoyleCount == 5) {
          gargoyleCount = 1;
        }
      });
    });
  }

  void moveCellion() {
    // Timer.periodic(Duration(milliseconds: 150), (timer) {
    //   setState(() {
    //     cellionCount++;
    //     if (cellionCount == 7) {
    //       cellionCount = 1;
    //     }
    //   });
    // });
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      setState(() {
        cellionCount++;
        if (cellionCount == 7) {
          cellionCount = 1;
        }
        if ((cellionPosx - windriderPosx).abs() > 0.2) {
          if (windriderDirection == 'right') {
            cellionPosx = windriderPosx - 0.2;
          } else if (windriderDirection == 'left') {
            cellionPosx = windriderPosx + 0.2;
          }
        }
        if (cellionPosx - windriderPosx > 0) {
          cellionDirection = 'left';
        } else {
          cellionDirection = 'right';
        }
      });
    });
  }

  void attack() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      setState(() {
        attackWindriderCount++;
      });

      if (attackWindriderCount == 12) {
        if (windriderDirection == 'right' &&
            windriderPosx + 0.2 > cellionPosx) {
          print('hit');
        } else {
          print('midded');
        }
        attackWindriderCount = 0;
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    setState(() {
      windriderPosx -= 0.03;
      windriderCount++;
      windriderDirection = 'left';
    });
  }

  void moveRight() {
    setState(() {
      windriderPosx += 0.03;
      windriderCount++;
      windriderDirection = 'right';
    });
  }

  void moveJump() {
    double time = 0;
    double height = 0;
    double initialHeight = windriderPosY;
    Timer.periodic(Duration(milliseconds: 70), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.5 * time;
      setState(() {
        if (initialHeight - height > 1) {
          windriderPosY = 1;
          timer.cancel();
          windriderCount = 1;
        } else {}
        windriderPosY = initialHeight - height;
        windriderCount = 2;
      });
    });
  }

  void startGameTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        loadingTimer--;
      });
      if (loadingTimer == 0) {
        setState(() {
          loadingScreenColor = Colors.transparent;
          loadingTimer = 3;
          loadingScreenText = Colors.transparent;
        });
        timer.cancel();
      }
    });
  }
}
