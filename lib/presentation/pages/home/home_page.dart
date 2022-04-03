import 'package:dog_app/presentation/core/icon/paw_icons.dart';
import 'package:dog_app/presentation/pages/home/widgets/home_body.dart';
import 'package:dog_app/presentation/router/app_router.dart';
import 'package:dog_app/presentation/utils/navigator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          child: HomeBody(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.navigateTo(
            context: context,
            route: const BreedsRoute(),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: const Icon(Paw.paw),
      ),
    );
  }
}
