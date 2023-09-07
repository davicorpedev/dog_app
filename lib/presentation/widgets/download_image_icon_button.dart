import 'package:dog_app/application/pages/download_image/download_image_cubit.dart';
import 'package:dog_app/domain/repositories/download_image_repository.dart';
import 'package:dog_app/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadImageIconButton extends StatelessWidget {
  final String url;

  const DownloadImageIconButton({Key? key, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownloadImageCubit>(
      create: (context) => DownloadImageCubit(
        repository: RepositoryProvider.of<DownloadImageRepository>(context),
      ),
      child: BlocConsumer<DownloadImageCubit, DownloadImageState>(
        listener: (context, state) {
          if (state is DownloadImageLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image downloaded')),
            );
          } else if (state is DownloadImageErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error while downloading the image'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DownloadImageLoadingState) {
            return const Center(child: CustomCircularProgressIndicator());
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
