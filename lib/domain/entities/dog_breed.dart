import 'package:dog_app/domain/core/entitites/breed.dart';

class DogBreed extends Breed {
  const DogBreed({
    required int id,
    required String name,
    required String? temperament,
    required String lifeSpan,
    required String? origin,
  }) : super(
          id: id,
          name: name,
          temperament: temperament,
          lifeSpan: lifeSpan,
          origin: origin,
        );
}
