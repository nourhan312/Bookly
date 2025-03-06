import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_server.dart';
import 'package:bookly/features/home/data/models/book/book.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServer apiServer;

  HomeRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, List<Book>>> getFeaturesBooks() async {
    try {
      var data = await apiServer.get(
          endpoint:
              'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest');
      List books = data['items'];
      return Right(books.map((e) => Book.fromJson(e)).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getNewestBooks() {
    throw UnimplementedError();
  }
}
