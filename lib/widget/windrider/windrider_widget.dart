import 'dart:math';

import 'package:flutter/material.dart';

class WindriderWidget extends StatelessWidget {
  final int windriderCount;
  final String windriderDirection;
  final int? attackWindriderCount;
  final bool? underAttack;
  final bool? currentlyLeveling;

  const WindriderWidget({
    Key? key,
    required this.windriderCount,
    required this.windriderDirection,
    this.attackWindriderCount,
    this.underAttack,
    this.currentlyLeveling,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int directionAsInt = 1;
    if (windriderDirection == 'right') {
      directionAsInt = 1;
    } else if (windriderDirection == 'left') {
      directionAsInt = 0;
    } else {
      directionAsInt = 1;
    }
// ***** move right and left
    if (attackWindriderCount == 0) {
      if (windriderDirection == 'left') {
        return Container(
          alignment: Alignment.bottomCenter,
          height: 100,
          width: 100,
          child: Image.asset(
            'assets/Windrider/Windrider' + windriderCount.toString() + '.png',
          ),
        );
      } else {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
            alignment: Alignment.bottomCenter,
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/Windrider/Windrider' + windriderCount.toString() + '.png',
            ),
          ),
        );
      }
    } else {
      // ***** move attack

      if (directionAsInt == 0) {
        return Container(
          width: 100,
          height: 100,
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/Windrider/Windrider_attack' +
                attackWindriderCount.toString() +
                '.png',
          ),
        );
      } else {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/Windrider/Windrider_attack' +
                  attackWindriderCount.toString() +
                  '.png',
            ),
          ),
        );
      }
    }
  }
}
