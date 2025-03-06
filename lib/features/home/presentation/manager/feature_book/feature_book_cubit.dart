import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book/book.dart';

part 'feature_book_state.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit(this.homeRepo) : super(FeatureBookInitial());
  final HomeRepo homeRepo;

  Future<void> getFeaturesBooks() async {
    emit(FeatureBookLoading());
    final result = await homeRepo.getFeaturesBooks();
    result.fold(
      (failure) => emit(FeatureBookFailure(failure.errorMessage)),
      (books) => emit(FeatureBookSuccess(books)),
    );
  }
}
