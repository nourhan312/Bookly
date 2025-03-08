import 'package:bookly/features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  void searchBook({required String query}) async {
    emit(SearchLoadingState());
    final response = await searchRepo.searchBooks(query: query);
    response.fold(
      (failure) => emit(SearchFailureState(failure.toString())),
      (booksList) => emit(SearchSuccessState(booksList, query)),
    );
  }
}
