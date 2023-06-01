import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/utils/dog_image_downloader.dart';
import 'package:flutter/services.dart';

abstract class UrlDownloaderRepository {
  Future<Result<bool>> download(String url);
}

class UrlDownloaderRepositoryImpl extends UrlDownloaderRepository {
  final DogImageDownloader _imageDownloader;

  UrlDownloaderRepositoryImpl({
    required DogImageDownloader imageDownloader,
  }) : _imageDownloader = imageDownloader;

  @override
  Future<Result<bool>> download(String url) async {
    try {
      await _imageDownloader.download(url);

      return const Result.success(true);
    } on PlatformException {
      return Result.error(InvalidUrlFailure());
    }
  }
}
