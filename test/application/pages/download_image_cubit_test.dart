import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/pages/download_image/download_image_cubit.dart';
import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/repositories/download_image_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUrlDownloaderRepository extends Mock
    implements DownloadImageRepository {}

void main() {
  late MockUrlDownloaderRepository repository;

  setUp(() {
    repository = MockUrlDownloaderRepository();
  });

  blocTest<DownloadImageCubit, DownloadImageState>(
    'initial state should be Empty',
    build: () => DownloadImageCubit(repository: repository),
    verify: (cubit) {
      expect(cubit.state, const DownloadImageInitialState());
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
      verify: (_) {
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
        const DownloadImageLoadingState(),
        const DownloadImageLoadedState(),
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
        const DownloadImageLoadingState(),
        const DownloadImageErrorState(),
      ],
    );
  });
}
