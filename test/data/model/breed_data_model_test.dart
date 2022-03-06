import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:dog_app/data/models/breed_data_model.dart';
import 'package:dog_app/domain/entities/breed_data.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tBreedModel = BreedDataModel(
    id: 1,
    name: 'test',
    temperament: 'test',
    lifeSpan: 'test',
    origin: 'test',
    image: 'test',
  );

  test(
    'should be a subclass of Breed entity',
    () async {
      expect(tBreedModel, isA<BreedData>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid object',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('breed.json'));

        final result = BreedDataModel.fromJson(jsonMap);

        expect(result, tBreedModel);
      },
    );
  });
}
