import 'package:dog_app/domain/core/entitites/breed.dart';

class BreedInfo extends Breed {
  final String image;

  const BreedInfo({
    required this.image,
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

  @override
  List<Object?> get props => [
        id,
        name,
        temperament,
        lifeSpan,
        origin,
        image,
      ];
}