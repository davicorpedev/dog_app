import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageURL;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
