import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/pages/dog/dog_detail/dog_detail_page.dart';

class DogGrid extends StatelessWidget {
  final List<Dog> dogs;

  const DogGrid({Key? key, required this.dogs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 4,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      itemCount: dogs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        Dog dog = dogs[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DogDetailPage(dog: dog)),
            );
          },
          child: Card(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: Hero(
                tag: dog.id,
                child: Image.network(dog.url),
              ),
            ),
          ),
        );
      },
    );
  }
}
