import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/pages/dog/dogs_by_breed/widgets/dog_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DogGrid extends StatelessWidget {
  final List<Dog> dogs;

  const DogGrid({Key? key, required this.dogs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      itemCount: dogs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return DogGridCard(dog: dogs[index]);
      },
    );
  }
}
