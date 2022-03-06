part of 'download_image_cubit.dart';

abstract class DownloadImageState extends Equatable {
  const DownloadImageState();

  @override
  List<Object> get props => [];
}

class Initial extends DownloadImageState {
  const Initial();
}

class Loading extends DownloadImageState {
  const Loading();
}

class Loaded extends DownloadImageState {
  const Loaded();
}

class Error extends DownloadImageState {
  const Error();
}
