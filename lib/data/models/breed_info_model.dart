import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/entities/id.dart';

class BreedInfoModel extends BreedInfo {
  const BreedInfoModel({
    required ID<BreedInfoModel> id,
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
      id: ID(json['id'].toString()),
      name: json['name'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'],
      origin: json['origin'],
      image: json['image']['url'],
    );
  }
}
