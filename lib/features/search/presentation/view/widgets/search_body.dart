import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_textfield.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          CustomSearchTextfield(),
          Text(
            'Best Sellers',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SearchResultListview(),
        ],
      ),
    );
  }
}
