import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book/book.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());

  final HomeRepo homeRepo;
  Future<void> getNewestBooks() async {
    emit(NewestBookLoading());
    final result = await homeRepo.getNewestBooks();
    result.fold(
      (failure) => emit(NewestBookFailure(failure.errorMessage)),
      (books) => emit(NewestBookSuccess(books)),
    );
  }
}
