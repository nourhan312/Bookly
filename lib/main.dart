import 'package:bookly/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/routes.dart';
import 'core/utils/service_lactors.dart';
import 'features/home/data/repo/home_repo_impl.dart';
import 'features/home/presentation/manager/feature_book/feature_book_cubit.dart';
import 'features/home/presentation/manager/newest_books/newest_book_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBookCubit(
            getIt.get<HomeRepoImpl>(),
          )..getFeaturesBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBookCubit(
            getIt.get<HomeRepoImpl>(),
          )..getNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primary,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
