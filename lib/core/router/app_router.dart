import 'package:clean_arch_bookly_app/features/details/presentation/views/details_view.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/preview_view.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/home_view.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/search_view.dart';
import 'package:clean_arch_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const homeView = '/home';
  static const detailsView = '/details';
  static const searchView = '/search';
  static const previewView = '/preview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: splashView, builder: (context, state) => SplashView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: detailsView,
        builder: (context, state) =>
            DetailsView(book: state.extra as BookEntity),
      ),
      GoRoute(path: searchView, builder: (context, state) => SearchView()),
      GoRoute(
        path: previewView,
        builder: (context, state) => PreviewView(url: state.extra as String),
      ),
    ],
  );
}
