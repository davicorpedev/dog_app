import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:dog_app/domain/entities/breed_data.dart';
import 'package:dog_app/presentation/pages/dog/dogs_by_breed/dogs_by_breed_page.dart';

class BreedGrid extends StatelessWidget {
  final List<BreedData> breeds;

  const BreedGrid({Key? key, required this.breeds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 4,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      itemCount: breeds.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        BreedData breed = breeds[index];

        return Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DogByBreedPage(breed: breed),
                ),
              );
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Image.network(breed.image),
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
      },
    );
  }
}
