import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            onPressed: () {},
            text: '19.555',
            topLeft: 15,
            bottomLeft: 15,
            color: Colors.white,
            textColor: Colors.black),
        CustomButton(
            onPressed: () {},
            text: 'Free Review',
            topRight: 15,
            bottomRight: 15,
            color: Colors.redAccent,
            textColor: Colors.white),
      ],
    );
  }
}
