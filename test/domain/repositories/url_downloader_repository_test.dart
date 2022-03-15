import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/core/utils/dog_image_downloader.dart';
import 'package:dog_app/domain/repositories/url_downloader_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDogImageDownloader extends Mock implements DogImageDownloader {}

void main() {
  late MockDogImageDownloader imageDownloader;
  late UrlDownloaderRepository repository;

  setUp(() {
    imageDownloader = MockDogImageDownloader();
    repository = UrlDownloaderRepositoryImpl(imageDownloader: imageDownloader);
  });

  group(
    'download',
    () {
      test(
        'should call download on imageDownloader',
        () async {
          when(() => imageDownloader.download(any())).thenAnswer(
            // ignore: avoid_returning_null_for_void
            (_) async => null,
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
            (_) async => null,
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
