import 'package:auto_route/auto_route.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/widgets/custom_cached_network_image.dart';
import 'package:dog_app/presentation/widgets/download_image_icon_button.dart';
import 'package:flutter/material.dart';

@RoutePage<String>()
class DogDetailPage extends StatelessWidget {
  final Dog dog;

  const DogDetailPage({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DownloadImageIconButton(url: dog.url),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Hero(
            tag: dog.id,
            child: CustomCachedNetworkImage(imageURL: dog.url),
          ),
        ),
      ),
    );
  }
}
