import 'package:dog_app/config/global_config.dart';
import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/data/datasources/breed_data_source.dart';
import 'package:dog_app/data/datasources/dog_data_source.dart';
import 'package:dog_app/domain/core/utils/dog_image_downloader.dart';
import 'package:dog_app/domain/core/utils/network_info.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:dog_app/domain/repositories/url_downloader_repository.dart';
import 'package:dog_app/presentation/app_initializer.dart';
import 'package:dog_app/presentation/core/theming/app_themes.dart';
import 'package:dog_app/presentation/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
            child: _buildRepositories(
              child: widget!,
            ),
          ),
        );
      },
      home: const WelcomePage(),
    );
  }

  Future<void> _setupConfiguration() async {
    await AppGlobalConfig().setupConfiguration();

    _apiClient = ApiClient(
      client: http.Client(),
      baseUrl: AppGlobalConfig().baseUrl,
      serverVersion: AppGlobalConfig().serverVersion,
      apiKey: AppGlobalConfig().apiKey,
    );
  }

  Widget _buildRepositories({required Widget child}) {
    return MultiProvider(
      providers: [
        RepositoryProvider<DogRepository>(
          create: (context) => DogRepository(
            dataSource: DogDataSource(client: _apiClient),
            networkInfo: NetworkInfo(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        RepositoryProvider<BreedRepository>(
          create: (context) => BreedRepository(
            dataSource: BreedDataSource(client: _apiClient),
            networkInfo: NetworkInfo(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        RepositoryProvider<UrlDownloaderRepository>(
          create: (context) => UrlDownloaderRepository(
            imageDownloader: DogImageDownloader(),
          ),
        ),
      ],
      child: child,
    );
  }
}
