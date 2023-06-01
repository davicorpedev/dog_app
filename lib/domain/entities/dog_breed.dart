import 'package:dog_app/domain/entities/id.dart';
import 'package:dog_app/domain/entities/breed.dart';

class DogBreed extends Breed {
  const DogBreed({
    required ID<DogBreed> id,
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
