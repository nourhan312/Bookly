import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/feature_book/feature_book_cubit.dart';
import 'listView_item.dart';

class FeatureListview extends StatelessWidget {
  const FeatureListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is FeatureBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListviewItem(
                  imageUrl:
                      state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircleAvatar(),
          );
        }
      },
    );
  }
}
