import 'package:flutter/material.dart';
import 'package:dog_app/domain/core/entitites/breed.dart';

class BreedInfo extends StatelessWidget {
  final Breed breed;

  const BreedInfo({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Breed Info',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text(
              'Name: ${breed.name}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 8),
            Text(
              'Origin: ${breed.origin ?? 'Unknown'}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 8),
            Text(
              'Temperament: ${breed.temperament}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 8),
            Text(
              'LifeSpan: ${breed.lifeSpan}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}