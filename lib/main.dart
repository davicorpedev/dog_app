import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dog_app/injection_container.dart' as di;
import 'package:dog_app/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();
  runApp(const App());
}
