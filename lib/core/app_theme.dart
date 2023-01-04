import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_app/core/utils/app_colors.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primary,
  dividerTheme: const DividerThemeData(color: AppColors.primary),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      height: 1.1,
    ),
  ),
);
