import 'dart:math';
import 'package:flutter/material.dart';

class AttackWidget extends StatelessWidget {
  final int attackCount;
  final String attackDirection;

  const AttackWidget({
    Key? key,
    required this.attackCount,
    required this.attackDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (attackDirection == 'left') {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 50,
      width: 50,
      child: Image.asset(
        'assets/Windrider/attack' + attackCount.toString() + '.png',
      ),
    );
    // } else {
    //   return Transform(
    //     alignment: Alignment.center,
    //     transform: Matrix4.rotationY(pi),
    //     child: Container(
    //       alignment: Alignment.bottomCenter,
    //       width: 50,
    //       height: 50,
    //       child: Image.asset(
    //         'assets/cellion/cellion' + cellionCount.toString() + '.png',
    //       ),
    //     ),
    //   );
    // }
  }
}
