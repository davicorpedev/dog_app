import 'package:dog_app/presentation/style/theming/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: context.read<AppTheme>().secondary,
    );
  }
}
