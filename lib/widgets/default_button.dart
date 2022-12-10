import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final bool border;
  final color;
  final Color textColor;
  final double width;
  final double height;
  final double textSize;
  final String text;
  final Function function;
  DefaultButton({
    this.color,
    this.border = true,
    required this.textColor,
    this.width = double.infinity,
    this.height = 50.0,
    this.textSize = 18.0,
    required this.text,
    required this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          border: border
              ? Border.all(color: textColor == Colors.white ? color : textColor)
              : null),
      height: height,
      child: MaterialButton(
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
        onPressed: () {
          function();
        },
      ),
    );
  }
}