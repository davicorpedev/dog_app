import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/data/datasources/breed_data_source.dart';
import 'package:dog_app/data/datasources/dog_data_source.dart';
import 'package:dog_app/domain/core/utils/dog_image_downloader.dart';
import 'package:dog_app/domain/core/utils/network_info.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:dog_app/domain/repositories/url_downloader_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class RepositoryBuilder extends StatelessWidget {
  final ApiClient apiClient;
  final Widget child;

  const RepositoryBuilder({
    Key? key,
    required this.apiClient,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<DogRepository>(
          create: (context) => DogRepository(
            dataSource: DogDataSource(client: apiClient),
            networkInfo: NetworkInfo(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        RepositoryProvider<BreedRepository>(
          create: (context) => BreedRepository(
            dataSource: BreedDataSource(client: apiClient),
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
