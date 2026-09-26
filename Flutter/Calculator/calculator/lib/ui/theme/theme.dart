import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const textTheme = TextTheme(
    displayMedium: TextStyle(
      fontSize: 75,
      fontWeight: FontWeight.w500,
      fontFamily: 'NanumGothicCoding',
      color: AppColors.textColor,
    ),
  );

  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    textTheme: textTheme,
    colorScheme: AppColors.customColorScheme,
  );
}

abstract final class AppColors {
  static const background = Colors.blueGrey;
  static const onBackground = Colors.white;
  static const primaryColor = Colors.grey;
  static const onPrimaryColor = Colors.black;
  static const secondaryColor = Colors.deepPurple;
  static const onSecondaryColor = Colors.white;
  static const errorColor = Colors.red;
  static const onErrorColor = Colors.redAccent;
  static const textColor = Color(0xFFAEAEAE);

  static const customColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.onPrimaryColor,
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.onSecondaryColor,
    surface: AppColors.background,
    onSurface: AppColors.onBackground,
    error: AppColors.errorColor,
    onError: AppColors.onErrorColor,
  );
}

abstract final class AppSpacing {
  static const double btnMatrixHorizontal = 15;
  static const double btnMatrixVertical = 5;
  static const double padding = 15;
}
