import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const textTheme = TextTheme(
    displayMedium: TextStyle(
      fontSize: 75,
      fontWeight: FontWeight.w500,
      fontFamily: 'NanumGothicCoding',
    ),
  );

  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    textTheme: textTheme,
  );
}

abstract final class AppColors {}

abstract final class AppSpacing {}
