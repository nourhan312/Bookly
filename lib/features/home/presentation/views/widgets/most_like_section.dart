import 'package:bookly/features/home/presentation/manager/similar_books/similar_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/listView_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/shimmer_feature_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostLikeSection extends StatelessWidget {
  const MostLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is SimilarBookSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListviewItem(
                    widthRatio: 0.2,
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks!.thumbnail!),
              ),
            ),
          );
        } else {
          return ShimmerFeatureItem();
        }
      },
    );
  }
}
