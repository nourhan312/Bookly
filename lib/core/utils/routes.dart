import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/core/utils/service_lactors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/features/home/data/models/book/book.dart';

import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/manager/similar_books/similar_book_cubit.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => SearchView(
      //       book: state.extra as Book,
      //   ),
      // ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBookCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(book: state.extra as Book)),
      ),
    ],
  );
}
