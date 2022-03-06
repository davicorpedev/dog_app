import 'package:flutter/services.dart';

import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/core/utils/dog_image_downloader.dart';

class UrlDownloaderRepository {
  final DogImageDownloader _imageDownloader;

  UrlDownloaderRepository(DogImageDownloader imageDownloader)
      : _imageDownloader = imageDownloader;

  Future<Result<bool>> download(String url) async {
    try {
      await _imageDownloader.download(url);

      return const Result.success(true);
    } on PlatformException {
      return Result.error(InvalidUrlFailure());
    }
  }
}
