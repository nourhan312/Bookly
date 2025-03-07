import 'package:bookly/features/search/presentation/view/widgets/search_body.dart'
    show SearchBody;
import 'package:flutter/material.dart';

import '../../../home/data/models/book/book.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchBody(
          book: book,
        ),
      ),
    );
  }
}
