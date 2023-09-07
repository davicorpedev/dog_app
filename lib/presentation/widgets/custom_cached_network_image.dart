import 'package:dog_app/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageURL;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageURL,
      loadingBuilder: (_, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CustomCircularProgressIndicator()),
        );
      },
    );
  }
}
