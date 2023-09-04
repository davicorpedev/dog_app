import 'package:auto_route/auto_route.dart';
import 'package:dog_app/presentation/navigation/app_router.dart';
import 'package:dog_app/presentation/navigation/navigator.dart';
import 'package:dog_app/presentation/pages/home/widgets/home_body.dart';
import 'package:dog_app/presentation/style/icon/paw_icons.dart';
import 'package:flutter/material.dart';

@RoutePage<String>()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: HomeBody(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.navigateTo(
            context: context,
            route: const BreedsFlowRoute(),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: const Icon(Paw.paw),
      ),
    );
  }
}
