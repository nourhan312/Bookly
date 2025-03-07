import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_server.dart';
import 'package:bookly/features/home/data/models/book/book.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServer _apiServer;

  SearchRepoImpl(
    this._apiServer,
  );

  @override
  Future<Either<Failure, List<Book>>> searchBooks(
      {required String query}) async {
    try {
      var data = await _apiServer.get(endpoint: 'volumes?q=$query');

      List books = data['items'];
      var result = books.map((e) => Book.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
