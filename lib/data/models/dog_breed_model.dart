import 'package:dog_app/domain/entities/dog_breed.dart';
import 'package:dog_app/domain/entities/id.dart';

class DogBreedModel extends DogBreed {
  const DogBreedModel({
    required ID<DogBreedModel> id,
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
      id: ID(json['id'].toString()),
      name: json['name'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      origin: json['origin'],
    );
  }
}
