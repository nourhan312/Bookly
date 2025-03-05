import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/buttons_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/most_like_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant.dart';
import 'listView_item.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          DetailsAppbar(),
          const SizedBox(height: 20),
          ListviewItem(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            'Book Title',
            style: Styles.textStyle30.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: kGtSectraFine,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Author Name',
            style: Styles.textStyle20.copyWith(
              fontFamily: kGtSectraFine,
            ),
          ),
          const SizedBox(height: 10),
          BookRating(),
          const SizedBox(height: 20),
          ButtonsSection(),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You Can Also Like',
              style: Styles.textStyle20,
            ),
          ),
          const SizedBox(height: 10),
          MostLikeSection(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
