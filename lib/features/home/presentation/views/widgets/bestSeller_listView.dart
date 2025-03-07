import 'package:bookly/features/home/presentation/views/widgets/bestSellerItem.dart';
import 'package:flutter/material.dart';

import '../../../data/models/book/book.dart';

class BestsellerListview extends StatelessWidget {
  const BestsellerListview({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BestsellerItem(
              book: book,
            ),
          );
        });
  }
}
