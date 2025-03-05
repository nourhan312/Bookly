import 'package:bookly/core/utils/app_assets.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utils/styles.dart';

class BestsellerItem extends StatelessWidget {
  const BestsellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: AspectRatio(
            aspectRatio: 0.63,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(AppAssets.testImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
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
                  'Harry Potter and the Philosopher\'s Stone',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: kGtSectraFine,
                  ),
                ),
              ),
              SizedBox(height: 3),
              Text(
                'F. Scott Fitzgerald',
                style: Styles.textStyle14.copyWith(
                  fontFamily: kGtSectraFine,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '20 ',
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  BookRating(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
