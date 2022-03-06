import 'package:dog_app/domain/entities/breed_data.dart';

class BreedDataModel extends BreedData {
  const BreedDataModel({
    required int id,
    required String name,
    required String temperament,
    required String lifeSpan,
    required String origin,
    required String image,
  }) : super(
          id: id,
          name: name,
          temperament: temperament,
          lifeSpan: lifeSpan,
          origin: origin,
          image: image,
        );

  factory BreedDataModel.fromJson(Map<String, dynamic> json) {
    return BreedDataModel(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      origin: json['origin'],
      image: json['image']['url'],
    );
  }
}
