import 'package:clean_arch_bookly_app/core/router/app_router.dart';
import 'package:clean_arch_bookly_app/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.system,
    );
  }
}
