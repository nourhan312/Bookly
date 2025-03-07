import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/manager/feature_book/feature_book_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest_books/newest_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestSellerItem.dart';
import 'package:bookly/features/home/presentation/views/widgets/featureListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(),
                FeatureListview(),
                const SizedBox(height: 20),
                Text(
                  'Best Sellers',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        BlocBuilder<NewestBookCubit, NewestBookState>(
          builder: (context, state) {
            if (state is NewestBookFailure) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(state.message),
                ),
              );
            } else if (state is NewestBookSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    child: BestsellerItem(
                      book: state.books[index],
                    ),
                  ),
                  childCount: state.books.length,
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => Padding(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          //       child: const BestsellerItem(),
          //     ),
          //     childCount: 10,
          //   ),
          // ),
        )
      ],
    );
  }
}
