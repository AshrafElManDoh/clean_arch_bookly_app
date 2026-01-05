import 'package:clean_arch_bookly_app/core/base_fuctions/get_it.dart';
import 'package:clean_arch_bookly_app/core/constants/constants.dart';
import 'package:clean_arch_bookly_app/core/router/app_router.dart';
import 'package:clean_arch_bookly_app/core/themes/app_themes.dart';
import 'package:clean_arch_bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        darkTheme: AppThemes.darkTheme,
        theme: AppThemes.lightTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}

Future<void> _initApp() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await _initHive();
  setupServiceLocator();
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Future.wait([
    Hive.openBox<BookEntity>(kOpenFeaturedBox),
    Hive.openBox<BookEntity>(kOpenNewestBox),
  ]);
}
