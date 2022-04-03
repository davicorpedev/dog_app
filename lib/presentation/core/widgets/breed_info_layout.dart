import 'package:dog_app/domain/entities/breed.dart';
import 'package:flutter/material.dart';

class BreedInfoLayout extends StatelessWidget {
  final Breed breed;

  const BreedInfoLayout({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
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
      ),
    );
  }
}
