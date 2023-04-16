import 'dart:math';
import 'package:flutter/material.dart';

class CellionWidget extends StatelessWidget {
  final int cellionCount;
  final String cellionDirection;

  const CellionWidget({
    Key? key,
    required this.cellionCount,
    required this.cellionDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cellionDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset(
          'assets/cellion/cellion' + cellionCount.toString() + '.png',
        ),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          width: 50,
          height: 50,
          child: Image.asset(
            'assets/cellion/cellion' + cellionCount.toString() + '.png',
          ),
        ),
      );
    }
  }
}
