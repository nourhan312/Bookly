import 'package:flutter/material.dart';

import '../../../../home/data/models/book/book.dart';
import '../../../../home/presentation/views/widgets/bestSellerItem.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestsellerItem(
                  book: book,
                ),
              );
            }));
  }
}
