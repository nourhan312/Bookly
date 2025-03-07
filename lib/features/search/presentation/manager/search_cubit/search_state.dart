import 'package:equatable/equatable.dart';

import '../../../../home/data/models/book/book.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState {
  SearchSuccessState(this.books);

  final List<Book> books;
}

final class SearchFailureState extends SearchState {
  final String errorMessage;

  SearchFailureState(this.errorMessage);
}
