import 'package:bookly/core/utils/routes.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book/book.dart';

class BestsellerItem extends StatelessWidget {
  const BestsellerItem({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 0.63,
                child: CachedNetworkImage(
                  imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),

          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(16),
          //     image: DecorationImage(
          //       image: AssetImage(AppAssets.testImage),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    book.volumeInfo!.title!,
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: kGtSectraFine,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  book.volumeInfo!.authors!.first,
                  style: Styles.textStyle14.copyWith(
                    fontFamily: kGtSectraFine,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free ',
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    BookRating(
                      count: book.volumeInfo!.ratingsCount ?? 0,
                      rating: book.volumeInfo!.averageRating ?? 0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
