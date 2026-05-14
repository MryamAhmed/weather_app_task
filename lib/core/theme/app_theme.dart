import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      useMaterial3: true,
    );
  }
}
