part of 'similar_book_cubit.dart';

@immutable
sealed class SimilarBookState extends Equatable {
  List<Object?> get props => throw UnimplementedError();
}

final class SimilarBookInitial extends SimilarBookState {}

final class SimilarBookLoading extends SimilarBookState {}

final class SimilarBookSuccess extends SimilarBookState {
  SimilarBookSuccess(this.books);

  final List<Book> books;
}

final class SimilarBookFailure extends SimilarBookState {
  SimilarBookFailure(this.errorMessage);

  final String errorMessage;
}
