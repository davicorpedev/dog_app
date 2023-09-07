import 'package:background_downloader/background_downloader.dart';

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
    final task = await DownloadTask(url: url).withSuggestedFilename(
      unique: true,
    );

    final result = await _downloader.download(task);

    await _downloader.moveToSharedStorage(
      task,
      SharedStorage.downloads,
    );

    return result.status == TaskStatus.complete;
  }
}
