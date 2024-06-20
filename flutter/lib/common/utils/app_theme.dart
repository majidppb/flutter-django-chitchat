import 'package:flutter/material.dart';

import 'app_colors.dart';

sealed class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primary,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primary,
  );
}
