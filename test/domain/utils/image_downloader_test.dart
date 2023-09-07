import 'package:background_downloader/background_downloader.dart';
import 'package:dog_app/domain/utils/image_downloader.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFileDownloader extends Mock implements FileDownloader {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ImageDownloader imageDownloader;
  late MockFileDownloader mockFileDownloader;

  setUp(
    () {
      mockFileDownloader = MockFileDownloader();
      imageDownloader = ImageDownloaderImpl(downloader: mockFileDownloader);
    },
  );

  test(
    'is a ImageDownloader',
    () {
      expect(imageDownloader, isA<ImageDownloader>());
    },
  );

  /*group(
    'download',
    () {
      final tTask = DownloadTask(url: 'url');

      setUpAll(() {
        registerFallbackValue(DownloadTask(url: ''));
      });

      void completeDownload() {
        when(
          () => mockFileDownloader.download(any()),
        ).thenAnswer(
          (invocation) async => TaskStatusUpdate(
            tTask,
            TaskStatus.complete,
          ),
        );
      }

      void moveImage() {
        when(
          () => mockFileDownloader.moveToSharedStorage(
            any(),
            SharedStorage.images,
          ),
        ).thenAnswer(
          (invocation) async => '',
        );
      }

      test(
        'should call the download method',
        () async {
          completeDownload();
          moveImage();

          await imageDownloader.download('url');

          verify(
            () => mockFileDownloader.download(any()),
          ).called(1);
        },
      );

      test(
        'should call the moveFileToSharedStorage method',
        () async {
          completeDownload();
          moveImage();

          await imageDownloader.download('url');

          verify(
            () => mockFileDownloader.moveToSharedStorage(
              any(),
              SharedStorage.images,
            ),
          ).called(1);
        },
      );
    },
  );*/
}
