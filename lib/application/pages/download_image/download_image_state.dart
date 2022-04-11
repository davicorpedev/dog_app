part of 'download_image_cubit.dart';

abstract class DownloadImageState extends Equatable {
  const DownloadImageState();

  @override
  List<Object> get props => [];
}

class DownloadImageInitialState extends DownloadImageState {
  const DownloadImageInitialState();
}

class DownloadImageLoadingState extends DownloadImageState {
  const DownloadImageLoadingState();
}

class DownloadImageLoadedState extends DownloadImageState {
  const DownloadImageLoadedState();
}

class DownloadImageErrorState extends DownloadImageState {
  const DownloadImageErrorState();
}
