import 'package:bookly/features/search/presentation/view/widgets/search_body.dart';
import 'package:flutter/material.dart';

import '../../../home/data/models/book/book.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
