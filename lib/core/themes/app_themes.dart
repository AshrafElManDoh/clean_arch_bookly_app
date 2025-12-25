import 'package:clean_arch_bookly_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackGroundColor,
    brightness: Brightness.dark,

    textTheme: GoogleFonts.montserratTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.darkOnSurface),
    ),

    iconTheme: IconThemeData(color: AppColors.darkOnSurface),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: GoogleFonts.montserratTextTheme(),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.onSurface),
    ),

    iconTheme: IconThemeData(color: AppColors.onSurface),
  );
}
