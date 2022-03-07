import 'dart:convert';

import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/domain/entities/dog_breed.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tDogBreedModel = DogBreedModel(
    id: 1,
    name: 'test',
    temperament: 'test',
    lifeSpan: 'test',
    origin: 'test',
  );

  test(
    'should be a subclass of DogBreed entity',
    () async {
      expect(tDogBreedModel, isA<DogBreed>());
    },
  );

  group(
    'fromJson',
    () {
      test('should return a valid object', () {
        final Map<String, dynamic> jsonMap = json.decode(fixture('breed.json'));

        final result = DogBreedModel.fromJson(jsonMap);

        expect(result, tDogBreedModel);
      });
    },
  );
}
