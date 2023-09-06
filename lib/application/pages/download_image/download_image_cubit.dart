import 'package:dog_app/domain/repositories/download_image_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'download_image_state.dart';

class DownloadImageCubit extends Cubit<DownloadImageState> {
  final DownloadImageRepository _repository;

  DownloadImageCubit({
    required DownloadImageRepository repository,
  })  : _repository = repository,
        super(const DownloadImageInitialState());

  Future<void> downloadImage(String url) async {
    emit(const DownloadImageLoadingState());

    final result = await _repository.download(url);

    result.when(
      error: (error) {
        emit(const DownloadImageErrorState());
      },
      success: (_) {
        emit(const DownloadImageLoadedState());
      },
    );
  }
}
