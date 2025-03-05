import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.textColor,
      this.topLeft,
      this.topRight,
      this.bottomLeft,
      this.bottomRight});

  final void Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft ?? 0),
                bottomRight: Radius.circular(bottomRight ?? 0),
                bottomLeft: Radius.circular(bottomLeft ?? 0),
                topRight: Radius.circular(topRight ?? 0),
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
