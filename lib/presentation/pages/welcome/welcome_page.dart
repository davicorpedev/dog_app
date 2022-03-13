import 'package:dog_app/presentation/core/icon/paw_icons.dart';
import 'package:dog_app/presentation/pages/breed/breed_page.dart';
import 'package:dog_app/presentation/pages/welcome/widgets/welcome_page_body.dart';
import 'package:dog_app/presentation/utils/navigator.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: WelcomePageBody(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.navigateTo(
            context: context,
            page: const BreedPage(),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: const Icon(Paw.paw),
      ),
    );
  }
}
