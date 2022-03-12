import 'package:flutter/material.dart';

class AppNavigator {
  static void navigateTo({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
