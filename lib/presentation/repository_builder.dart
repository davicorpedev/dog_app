import 'package:background_downloader/background_downloader.dart';
import 'package:dog_app/data/client/api_client.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:dog_app/domain/repositories/download_image_repository.dart';
import 'package:dog_app/domain/utils/image_downloader.dart';
import 'package:dog_app/domain/utils/network_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class RepositoryBuilder extends StatelessWidget {
  final ApiClient apiClient;
  final Widget child;

  const RepositoryBuilder({
    Key? key,
    required this.child,
    required this.apiClient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<DogRepository>(
          create: (context) => DogRepositoryImpl(
            apiClient: apiClient,
            networkInfo: NetworkInfoImpl(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        RepositoryProvider<BreedRepository>(
          create: (context) => BreedRepositoryImpl(
            apiClient: apiClient,
            networkInfo: NetworkInfoImpl(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        RepositoryProvider<DownloadImageRepository>(
          create: (context) => DownloadImageRepositoryImpl(
            imageDownloader: ImageDownloaderImpl(
              downloader: FileDownloader(),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
