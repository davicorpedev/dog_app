import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/repositories/download_image_repository.dart';
import 'package:dog_app/domain/utils/image_downloader.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogImageDownloader extends Mock implements ImageDownloader {}

void main() {
  late MockDogImageDownloader imageDownloader;
  late DownloadImageRepository repository;

  setUp(() {
    imageDownloader = MockDogImageDownloader();
    repository = DownloadImageRepositoryImpl(imageDownloader: imageDownloader);
  });

  group(
    'download',
    () {
      test(
        'should call download on imageDownloader',
        () async {
          when(() => imageDownloader.download(any())).thenAnswer(
            // ignore: avoid_returning_null_for_void
            (_) async => true,
          );

          await repository.download('url');

          verify(() => imageDownloader.download('url')).called(1);
        },
      );

      test(
        'should return true if the image has been downloaded',
        () async {
          when(() => imageDownloader.download(any())).thenAnswer(
            // ignore: avoid_returning_null_for_void
            (_) async => true,
          );

          final result = await repository.download('url');

          expect(
            result,
            const Result<bool>.success(true),
          );
        },
      );

      test(
        'should return InvalidUrlFailure if the image has NOT been downloaded',
        () async {
          when(() => imageDownloader.download(any())).thenAnswer(
            // ignore: avoid_returning_null_for_void
            (_) async => false,
          );

          final result = await repository.download('url');

          expect(
            result,
            Result<bool>.error(InvalidUrlFailure()),
          );
        },
      );

      test(
        'should return InvalidUrlFailure if an error has occurred while downloading',
        () async {
          when(() => imageDownloader.download(any())).thenThrow(
            PlatformException(code: '1'),
          );

          final result = await repository.download('url');

          expect(
            result,
            Result<bool>.error(InvalidUrlFailure()),
          );
        },
      );
    },
  );
}
