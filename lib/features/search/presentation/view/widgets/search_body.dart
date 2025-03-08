// import 'package:bookly/features/search/presentation/view/widgets/search_result_listview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/utils/styles.dart';
// import '../../../../../core/widgets/custom_error.dart';
// import '../../../../../core/widgets/custom_loading.dart';
// import '../../manager/search_cubit/search_cubit.dart';
// import '../../manager/search_cubit/search_state.dart';
// import 'custom_search_appbar.dart';
//
// class SearchViewBody extends StatelessWidget {
//   const SearchViewBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchCubit, SearchState>(
//       builder: (context, state) {
//         return CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30, right: 30, left: 2),
//                 child: Column(
//                   children: [
//                     const CustomSearchAppBar(),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30, left: 30),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Search Results',
//                           style: Styles.textStyle18.copyWith(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//             state is SearchLoadingState
//                 ? const SliverFillRemaining(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: CustomLoadingIndicator(),
//                     ),
//                   )
//                 : SliverFillRemaining(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: BlocBuilder<SearchCubit, SearchState>(
//                         builder: (context, state) {
//                           if (state is SearchSuccessState) {
//                             return SearchResultListview(
//                               searchBooksResult: state.books,
//                             );
//                           } else if (state is SearchLoadingState) {
//                             return const CustomLoadingIndicator();
//                           } else if (state is SearchInitial) {
//                             return Center(
//                               child: Image.asset(
//                                 'assets/images/Animation.gif',
//                                 height: 300,
//                                 fit: BoxFit.fill,
//                               ),
//                             );
//                           } else {
//                             return CustomErrorWidget(
//                               errMessage: state is SearchFailureState
//                                   ? state.errorMessage
//                                   : 'An error occurred',
//                             );
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:bookly/features/search/presentation/view/widgets/custom_search_textfield.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/search_cubit/search_cubit.dart';
import '../../manager/search_cubit/search_state.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomSearchTextField(
            controller: controller,
            onPressed: () {
              if (controller.text.isNotEmpty) {
                BlocProvider.of<SearchCubit>(context)
                    .searchBook(query: controller.text);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a search query'),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Search Results',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return Center(
                    child: Image.asset(
                      'assets/images/Animation.gif',
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                  );
                } else {
                  return const SearchResultListview();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
