import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dog_app/application/breed/breed_bloc.dart';
import 'package:dog_app/application/dog/dogs_by_breed/dogs_by_breed_bloc.dart';
import 'package:dog_app/application/dog/random_dog/random_dog_bloc.dart';
import 'package:dog_app/application/download_image/download_image_cubit.dart';
import 'package:dog_app/domain/core/utils/network_info.dart';
import 'package:dog_app/data/data_source/breed_data_source.dart';
import 'package:dog_app/data/data_source/dog_data_source.dart';
import 'package:dog_app/domain/core/utils/dog_image_downloader.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:dog_app/domain/repositories/url_downloader_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  /// Features - Breed
  // Bloc
  sl.registerFactory<BreedBloc>(
    () => BreedBloc(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<BreedRepository>(
    () => BreedRepository(
      dataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<BreedDataSource>(
    () => BreedDataSource(client: sl()),
  );

  /// Features - RandomDog
  // Bloc
  sl.registerFactory<RandomDogBloc>(
    () => RandomDogBloc(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<DogRepository>(
    () => DogRepository(
      dataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DogDataSource>(
    () => DogDataSource(client: sl()),
  );

  /// Features - GetDogsByBreed
  // Bloc
  sl.registerFactory<DogsByBreedBloc>(
    () => DogsByBreedBloc(
      repository: sl(),
    ),
  );

  /// Core
  // Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl()));

  // Util
  sl.registerLazySingleton<DogImageDownloader>(
    () => DogImageDownloader(),
  );
  sl.registerLazySingleton<UrlDownloaderRepository>(
    () => UrlDownloaderRepository(sl()),
  );

  // Features
  sl.registerFactory<DownloadImageCubit>(
      () => DownloadImageCubit(repository: sl()));

  /// External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
