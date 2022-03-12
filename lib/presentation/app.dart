import 'package:dog_app/config/global_config.dart';
import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/presentation/app_initializer.dart';
import 'package:dog_app/presentation/core/theming/app_themes.dart';
import 'package:dog_app/presentation/pages/welcome/welcome_page.dart';
import 'package:dog_app/presentation/repository_builder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ApiClient _apiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DogApp',
      theme: AppThemes.appTheme,
      builder: (context, widget) {
        return AppInitializer(
          initializeTasks: () async {
            await _setupConfiguration();
          },
          initalizedBuilder: (context) => Provider.value(
            value: _apiClient,
            child: RepositoryBuilder(
              apiClient: _apiClient,
              child: widget!,
            ),
          ),
        );
      },
      home: const WelcomePage(),
    );
  }

  Future<void> _setupConfiguration() async {
    final config = AppGlobalConfig();

    await config.setupConfiguration();

    _apiClient = ApiClient(
      client: http.Client(),
      baseUrl: config.baseUrl,
      serverVersion: config.serverVersion,
      apiKey: config.apiKey,
    );
  }
}
