import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/functions/lanuch_url.dart';
import '../../../data/models/book/book.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            onPressed: () {},
            text: getText(book),
            topLeft: 15,
            bottomLeft: 15,
            color: Colors.white,
            textColor: Colors.black),
        CustomButton(
            onPressed: () {
              launchCustomUr(context, book.volumeInfo!.previewLink);
            },
            text: 'Review',
            topRight: 15,
            bottomRight: 15,
            color: Colors.redAccent,
            textColor: Colors.white),
      ],
    );
  }
}

String getText(Book bookModel) {
  if (bookModel.volumeInfo?.previewLink == null) {
    return 'Not Avaliable';
  } else {
    return 'Preview';
  }
}
