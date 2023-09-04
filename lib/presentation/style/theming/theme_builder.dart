import 'package:dog_app/presentation/style/theming/app_themes.dart';
import 'package:flutter/material.dart';

extension ThemeBuilder on AppTheme {
  ThemeData get themeData {
    return ThemeData(
      primaryColor: primary,
      brightness: brightness,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primary,
        secondary: secondary,
      ),
      textTheme: textTheme,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
        ),
      ),
    );
  }
}
