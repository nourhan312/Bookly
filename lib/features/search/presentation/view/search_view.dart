import 'package:bookly/features/search/presentation/view/widgets/search_body.dart'
    show SearchBody;
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchBody(),
      ),
    );
  }
}
