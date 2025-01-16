import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themecolor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themecolor,
      ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: inputDecorationTheme(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      textTheme: textTheme(),
      textButtonTheme: textButtonTheme(),
    );
  }

  static ThemeData get darkThemeData {
    return ThemeData(
        colorSchemeSeed: AppColors.themecolor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themecolor,
        ),
        brightness: Brightness.dark);
  }

  static InputDecorationTheme inputDecorationTheme() {
    return const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themecolor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themecolor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themecolor, width: 1),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.themecolor,
        foregroundColor: Colors.white,
        fixedSize: const Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  static TextTheme textTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextButtonThemeData textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.themecolor,
      ),
    );
  }
}
