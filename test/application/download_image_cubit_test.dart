import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/download_image/download_image_cubit.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/repositories/url_downloader_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUrlDownloaderRepository extends Mock
    implements UrlDownloaderRepository {}

void main() {
  late MockUrlDownloaderRepository repository;

  setUp(() {
    repository = MockUrlDownloaderRepository();
  });

  blocTest<DownloadImageCubit, DownloadImageState>(
    'initial state should be Empty',
    build: () => DownloadImageCubit(repository: repository),
    verify: (bloc) {
      expect(bloc.state, const Initial());
    },
  );

  group('download', () {
    blocTest<DownloadImageCubit, DownloadImageState>(
      'should get image from url',
      build: () => DownloadImageCubit(repository: repository),
      setUp: () {
        when(() => repository.download(any())).thenAnswer(
          (_) async => const Result<bool>.success(true),
        );
      },
      act: (cubit) => cubit.downloadImage('url'),
      verify: (bloc) {
        verify(() => repository.download('url')).called(1);
      },
    );

    blocTest<DownloadImageCubit, DownloadImageState>(
      'should emit [Loading, Loaded] when the image is downloaded successfully',
      build: () => DownloadImageCubit(repository: repository),
      setUp: () {
        when(() => repository.download(any())).thenAnswer(
          (_) async => const Result<bool>.success(true),
        );
      },
      act: (cubit) => cubit.downloadImage('url'),
      expect: () => [
        const Loading(),
        const Loaded(),
      ],
    );

    blocTest<DownloadImageCubit, DownloadImageState>(
      'should emit [Loading, Error] when the image is NOT downloaded',
      build: () => DownloadImageCubit(repository: repository),
      setUp: () {
        when(() => repository.download(any())).thenAnswer(
          (_) async => Result<bool>.error(InvalidUrlFailure()),
        );
      },
      act: (cubit) => cubit.downloadImage('url'),
      expect: () => [
        const Loading(),
        const Error(),
      ],
    );
  });
}
