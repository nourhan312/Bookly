// import 'package:flutter/material.dart';
//
// import '../../../../home/data/models/book/book.dart';
// import '../../../../home/presentation/views/widgets/bestSellerItem.dart';
//
// class SearchResultListview extends StatelessWidget {
//   const SearchResultListview({super.key, required this.searchBooksResult});
//
//   final List<Book> searchBooksResult;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: ListView.builder(
//             padding: EdgeInsets.zero,
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BestsellerItem(
//                   book: searchBooksResult[index],
//                 ),
//               );
//             }));
//   }
// }

import 'package:bookly/features/home/presentation/views/widgets/shimmer_best_seller.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/views/widgets/bestSellerItem.dart';
import '../../manager/search_cubit/search_state.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchFailureState) {
        return Center(
          child: Text(state.errorMessage),
        );
      } else if (state is SearchSuccessState) {
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestsellerItem(
                  book: state.books[index],
                ),
              );
            },
          ),
        );
      } else {
        return ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ShimmerBestsellerItem(),
          );
        });
      }
    });
  }
}
