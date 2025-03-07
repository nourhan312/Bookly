import 'package:bookly/features/search/data/repos/search_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/search/data/repos/search_repo.dart';
import 'api_server.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServer>(ApiServer(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiServer>(),
  ));

  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );
}
