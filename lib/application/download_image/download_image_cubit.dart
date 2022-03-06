import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dog_app/domain/repositories/url_downloader_repository.dart';
part 'download_image_state.dart';

class DownloadImageCubit extends Cubit<DownloadImageState> {
  final UrlDownloaderRepository _repository;

  DownloadImageCubit({
    required UrlDownloaderRepository repository,
  })  : _repository = repository,
        super(const Initial());

  Future<void> downloadImage(String url) async {
    emit(const Loading());

    final result = await _repository.download(url);

    result.when(
      error: (error) {
        emit(const Error());
      },
      success: (_) {
        emit(const Loaded());
      },
    );
  }
}
