import 'package:dog_app/domain/entities/id.dart';
import 'package:equatable/equatable.dart';

abstract class Breed extends Equatable {
  final ID<Breed> id;
  final String name;
  final String? temperament;
  final String lifeSpan;
  final String? origin;

  const Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.lifeSpan,
    required this.origin,
  });

  @override
  List<Object?> get props => [id, name, temperament, lifeSpan, origin];
}
