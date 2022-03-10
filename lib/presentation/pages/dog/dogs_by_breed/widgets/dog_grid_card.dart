import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/core/widgets/custom_cached_network_image.dart';
import 'package:dog_app/presentation/pages/dog/dog_detail/dog_detail_page.dart';
import 'package:flutter/material.dart';

class DogGridCard extends StatelessWidget {
  final Dog dog;

  const DogGridCard({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DogDetailPage(dog: dog)),
          );
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          child: Hero(
            tag: dog.id,
            child: CustomCachedNetworkImage(imageURL: dog.url),
          ),
        ),
      ),
    );
  }
}
