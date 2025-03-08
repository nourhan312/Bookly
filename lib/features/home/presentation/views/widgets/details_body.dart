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
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          DetailsAppbar(),
          const SizedBox(height: 10),
          ListviewItem(
            imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
            widthRatio: 0.56,
            aspectRatio: 0.69,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              book.volumeInfo!.title!,
              style: Styles.textStyle30.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: kGtSectraFine,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            book.volumeInfo!.authors![0],
            style: Styles.textStyle20.copyWith(
              fontFamily: kGtSectraFine,
            ),
          ),
          const SizedBox(height: 10),
          BookRating(
            rating: book.volumeInfo!.averageRating ?? 0,
            count: book.volumeInfo!.ratingsCount ?? 0,
          ),
          const SizedBox(height: 15),
          ButtonsSection(
            book: book,
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You Can Also Like',
              style: Styles.textStyle20,
            ),
          ),
          const SizedBox(height: 8),
          MostLikeSection(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
