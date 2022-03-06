import 'package:dog_app/domain/entities/breed_info.dart';

class BreedInfoModel extends BreedInfo {
  const BreedInfoModel({
    required int id,
    required String name,
    required String? temperament,
    required String lifeSpan,
    required String? origin,
    required String image,
  }) : super(
          id: id,
          name: name,
          temperament: temperament,
          lifeSpan: lifeSpan,
          origin: origin,
          image: image,
        );

  factory BreedInfoModel.fromJson(Map<String, dynamic> json) {
    return BreedInfoModel(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      origin: json['origin'],
      image: json['image']['url'],
    );
  }
}
