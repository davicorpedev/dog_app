import 'package:dog_app/domain/entities/dog_breed.dart';
import 'package:equatable/equatable.dart';

class Dog extends Equatable {
  final String id;
  final String url;
  final List<DogBreed> breeds;

  const Dog({
    required this.id,
    required this.url,
    required this.breeds,
  });

  @override
  List<Object> get props => [id, url, breeds];
}
