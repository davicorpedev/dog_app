import 'package:flutter/material.dart';
import 'package:dog_app/presentation/app_themes.dart';

import 'package:dog_app/presentation/pages/welcome/welcome_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoggoApp',
      theme: AppThemes.appTheme,
      home: const WelcomePage(),
    );
  }
}
