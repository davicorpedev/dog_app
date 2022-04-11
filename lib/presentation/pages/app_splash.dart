import 'package:flutter/material.dart';

class AppSplash extends StatelessWidget {
  final Widget? child;

  const AppSplash({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: child,
      ),
    );
  }
}
