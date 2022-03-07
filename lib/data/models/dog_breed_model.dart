import 'package:dog_app/domain/entities/dog_breed.dart';

class DogBreedModel extends DogBreed {
  const DogBreedModel({
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

  factory DogBreedModel.fromJson(Map<String, dynamic> json) {
    return DogBreedModel(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      origin: json['origin'],
    );
  }
}
