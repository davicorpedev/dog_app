import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_app/application/download_image/download_image_cubit.dart';
import 'package:dog_app/injection_container.dart';

class DownloadImageIconButton extends StatefulWidget {
  final String url;

  const DownloadImageIconButton({Key? key, required this.url})
      : super(key: key);

  @override
  _DownloadImageIconButtonState createState() =>
      _DownloadImageIconButtonState();
}

class _DownloadImageIconButtonState extends State<DownloadImageIconButton> {
  DownloadImageCubit cubit = sl<DownloadImageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadImageCubit, DownloadImageState>(
      bloc: cubit,
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
            cubit.downloadImage(widget.url);
          },
        );
      },
    );
  }
}
