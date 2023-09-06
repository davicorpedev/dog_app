import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/utils/image_downloader.dart';
import 'package:flutter/services.dart';

abstract class DownloadImageRepository {
  Future<Result<bool>> download(String url);
}

class DownloadImageRepositoryImpl extends DownloadImageRepository {
  final ImageDownloader _imageDownloader;

  DownloadImageRepositoryImpl({
    required ImageDownloader imageDownloader,
  }) : _imageDownloader = imageDownloader;

  @override
  Future<Result<bool>> download(String url) async {
    try {
      final isSuccessful = await _imageDownloader.download(url);

      if (isSuccessful) return const Result.success(true);

      return Result.error(InvalidUrlFailure());
    } on PlatformException {
      return Result.error(InvalidUrlFailure());
    }
  }
}
