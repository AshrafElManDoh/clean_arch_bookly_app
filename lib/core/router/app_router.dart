import 'package:clean_arch_bookly_app/features/home/presentation/views/home_view.dart';
import 'package:clean_arch_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const homeView = '/home';

  static final router = GoRouter(
    routes: [
      GoRoute(path: splashView, builder: (context, state) => SplashView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
    ],
  );
}
