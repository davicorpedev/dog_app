import 'package:dog_app/presentation/style/theming/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ThemeBuilder on AppTheme {
  ThemeData get themeData {
    return ThemeData(
      primaryColor: primary,
      brightness: brightness,
      scaffoldBackgroundColor: background,
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
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: background,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: secondary,
        ),
        iconTheme: IconThemeData(color: secondary),
        actionsIconTheme: IconThemeData(color: secondary),
      ),
    );
  }
}
