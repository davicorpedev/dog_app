import 'package:flutter/material.dart';

abstract class AppTheme {
  late final Color primary;
  late final Color secondary;
  late final TextTheme textTheme;
  late final Brightness brightness;
}

class LightTheme implements AppTheme {
  @override
  Color primary = const Color(0xFFf0e4b1);

  @override
  Color secondary = const Color(0xFF5a3a1a);

  @override
  TextTheme textTheme = const TextTheme(
    headlineSmall: TextStyle(
      color: Color(0xFF5a3a1a),
    ),
    titleLarge: TextStyle(
      color: Color(0xFF5a3a1a),
    ),
    displaySmall: TextStyle(
      color: Color(0xFF5a3a1a),
    ),
    titleMedium: TextStyle(
      color: Color(0xFF5a3a1a),
    ),
    titleSmall: TextStyle(
      color: Color(0xFF5a3a1a),
    ),
    bodyLarge: TextStyle(
      color: Color(0xFF5a3a1a),
    ),
    bodyMedium: TextStyle(
      color: Color(0xFF5a3a1a),
    ),
  );

  @override
  Brightness brightness = Brightness.light;
}
