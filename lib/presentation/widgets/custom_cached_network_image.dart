import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageURL;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return CachedNetworkImage(
      imageUrl: imageURL,
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );*/
    return Image.network(
      imageURL,
      loadingBuilder: (_, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
