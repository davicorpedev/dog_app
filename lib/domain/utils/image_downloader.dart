import 'package:background_downloader/background_downloader.dart';

// TODO: check this functionality

abstract class ImageDownloader {
  Future<bool> download(String url);
}

class ImageDownloaderImpl implements ImageDownloader {
  final FileDownloader _downloader;

  ImageDownloaderImpl({
    required FileDownloader downloader,
  }) : _downloader = downloader;

  @override
  Future<bool> download(String url) async {
    final task = DownloadTask(url: url);

    final result = await _downloader.download(task);

    await FileDownloader().moveToSharedStorage(
      task,
      SharedStorage.images,
    );

    return result.status == TaskStatus.complete;
  }
}
