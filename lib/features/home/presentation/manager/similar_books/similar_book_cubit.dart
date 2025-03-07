import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book/book.dart';
import '../../../data/repo/home_repo.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required category}) async {
    emit(SimilarBookLoading());
    final result = await homeRepo.getSimilarBooks(bookCategory: category);
    result.fold(
      (failure) => emit(SimilarBookFailure(failure.errorMessage)),
      (books) => emit(SimilarBookSuccess(books)),
    );
  }
}
