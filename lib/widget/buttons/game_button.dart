import 'package:flutter/material.dart';
import 'package:game_aventure/utils/size.dart';

class GameButton extends StatelessWidget {
  final Icon icon;
  final Function() onTap;

  const GameButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sizeWidth(context) * 0.01),
      child: GestureDetector(
        onTap: this.onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(sizeWidth(context) * 0.02),
            color: Colors.grey[700],
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
