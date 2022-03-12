import 'package:dog_app/domain/repositories/url_downloader_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_app/application/download_image/download_image_cubit.dart';

class DownloadImageIconButton extends StatelessWidget {
  final String url;

  const DownloadImageIconButton({Key? key, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownloadImageCubit>(
      create: (context) => DownloadImageCubit(
        repository: RepositoryProvider.of<UrlDownloaderRepository>(context),
      ),
      child: BlocConsumer<DownloadImageCubit, DownloadImageState>(
        listener: (context, state) {
          if (state is Loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image downloaded')),
            );
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error')),
            );
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return IconButton(
            icon: const Icon(Icons.file_download),
            tooltip: 'Click here to download this image',
            onPressed: () {
              context.read<DownloadImageCubit>().downloadImage(url);
            },
          );
        },
      ),
    );
  }
}
