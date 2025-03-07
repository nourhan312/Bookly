import 'package:bookly/features/home/data/models/book/book.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> getNewestBooks();

  Future<Either<Failure, List<Book>>> getFeaturesBooks();
  Future<Either<Failure, List<Book>>> getSimilarBooks(
      {required String bookCategory});
}
