import 'dart:math';
import 'package:flutter/material.dart';

class GargoyleWidget extends StatelessWidget {
  final int gargoyleCount;
  final String gargolyneDirection;

  const GargoyleWidget({
    Key? key,
    required this.gargoyleCount,
    required this.gargolyneDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (gargolyneDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 100,
        width: 100,
        child: Image.asset(
          'assets/gargoyle/gargoyle' + gargoyleCount.toString() + '.png',
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
            'assets/gargoyle/gargoyle' + gargoyleCount.toString() + '.png',
          ),
        ),
      );
    }
  }
}
