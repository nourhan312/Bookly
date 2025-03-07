import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.count, required this.rating});

  final int count;

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: AppColors.yellow,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text('$rating', style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text(
          '($count)',
          style: Styles.textStyle14.copyWith(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
