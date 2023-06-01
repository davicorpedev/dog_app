import 'dart:convert';

import 'package:dog_app/data/models/dog_breed_model.dart';
import 'package:dog_app/data/models/dog_model.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tDogModel = DogModel(
    id: ID('test'),
    url: 'test',
    breeds: [
      DogBreedModel(
        id: ID('1'),
        name: 'test',
        temperament: 'test',
        lifeSpan: 'test',
        origin: 'test',
      ),
    ],
  );

  test(
    'should be a subclass of Dog entity',
    () async {
      expect(tDogModel, isA<Dog>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid object',
      () {
        final Map<String, dynamic> jsonMap = json.decode(fixture('dog.json'));

        final result = DogModel.fromJson(jsonMap);

        expect(result, tDogModel);
      },
    );
  });
}
