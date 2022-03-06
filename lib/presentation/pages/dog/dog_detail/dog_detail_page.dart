import 'package:flutter/material.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/core/widgets/download_image_icon_button.dart';

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
            child: Image.network(dog.url),
          ),
        ),
      ),
    );
  }
}
