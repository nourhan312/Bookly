import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/book/book.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Book>>> searchBooks({required String query});
}
