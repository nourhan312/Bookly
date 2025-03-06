part of 'feature_book_cubit.dart';

@immutable
abstract class FeatureBookState extends Equatable {
  @override
  List<Object> get props => [];
}

final class FeatureBookInitial extends FeatureBookState {}

final class FeatureBookLoading extends FeatureBookState {}

final class FeatureBookSuccess extends FeatureBookState {
  final List<Book> books;

  FeatureBookSuccess(this.books);
}

final class FeatureBookFailure extends FeatureBookState {
  final String message;

  FeatureBookFailure(this.message);
}
