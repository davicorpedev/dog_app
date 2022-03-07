import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/dog_breed.dart';

class DogModel extends Dog {
  const DogModel({
    required String id,
    required String url,
    required List<DogBreed> breeds,
  }) : super(
          id: id,
          url: url,
          breeds: breeds,
        );

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      id: json['id'],
      url: json['url'],
      breeds: json['breeds']
          .map<DogBreedModel>((v) => DogBreedModel.fromJson(v))
          .toList(),
    );
  }
}
