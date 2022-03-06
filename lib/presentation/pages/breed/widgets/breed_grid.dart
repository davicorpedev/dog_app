import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/presentation/pages/breed/widgets/breed_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BreedGrid extends StatelessWidget {
  final List<BreedInfo> breeds;

  const BreedGrid({Key? key, required this.breeds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      itemCount: breeds.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return BreedGridCard(breed: breeds[index]);
      },
    );
  }
}
