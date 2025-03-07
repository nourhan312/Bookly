import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/buttons_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/most_like_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant.dart';
import '../../../data/models/book/book.dart';
import 'listView_item.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          DetailsAppbar(),
          const SizedBox(height: 10),
          ListviewItem(
            imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
            widthRatio: 0.45,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              book.volumeInfo!.title!,
              style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: kGtSectraFine,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            book.volumeInfo!.authors![0],
            style: Styles.textStyle20.copyWith(
              fontFamily: kGtSectraFine,
            ),
          ),
          const SizedBox(height: 10),
          BookRating(
            rating: 4.5,
            count: 100,
          ),
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
