import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/presentation/core/widgets/custom_cached_network_image.dart';
import 'package:dog_app/presentation/router/app_router.dart';
import 'package:dog_app/presentation/utils/navigator.dart';
import 'package:flutter/material.dart';

class BreedGridCard extends StatelessWidget {
  final BreedInfo breed;

  const BreedGridCard({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () {
          AppNavigator.navigateTo(
            context: context,
            route: DogsByBreedRoute(breed: breed),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: CustomCachedNetworkImage(imageURL: breed.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                breed.name,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
