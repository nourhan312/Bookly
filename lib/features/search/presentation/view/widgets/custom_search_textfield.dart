import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final TextEditingController controller;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) => onPressed!.call(),
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: IconButton(
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
          ),
          onPressed: onPressed,
        ),
        border: buildOutlineInputBorder(),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
}
