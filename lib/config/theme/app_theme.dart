import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    backgroundColor: AppColors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      subtitle1: TextStyle(
        fontSize: 20,
        color: AppColors.primary,
      ),
      subtitle2: TextStyle(
        fontSize: 20,
        color: AppColors.grey,
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        color: AppColors.grey,
      ),
    ),
  );
}
