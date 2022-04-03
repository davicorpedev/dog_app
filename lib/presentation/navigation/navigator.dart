import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static void navigateTo({
    required BuildContext context,
    required PageRouteInfo<dynamic> route,
  }) {
    AutoRouter.of(context).push(route);
  }

  static void pop(BuildContext context) {
    AutoRouter.of(context).pop();
  }
}
