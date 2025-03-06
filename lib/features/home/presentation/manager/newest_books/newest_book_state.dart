part of 'newest_book_cubit.dart';

@immutable
abstract class NewestBookState extends Equatable {
  @override
  List<Object> get props => [];
}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoading extends NewestBookState {}

final class NewestBookSuccess extends NewestBookState {
  final List<Book> books;

  NewestBookSuccess(this.books);
}

final class NewestBookFailure extends NewestBookState {
  final String message;

  NewestBookFailure(this.message);
}
