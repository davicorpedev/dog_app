import 'package:dog_app/data/datasources/breed_data_source.dart';
import 'package:dog_app/data/error/exceptions.dart';
import 'package:dog_app/data/models/breed_info_model.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils/mock_network_info.dart';

class MockBreedDataSource extends Mock implements BreedDataSource {}

void main() {
  late MockNetworkInfo networkInfo;
  late MockBreedDataSource dataSource;
  late BreedRepository repository;

  setUp(() {
    networkInfo = MockNetworkInfo();
    dataSource = MockBreedDataSource();
    repository = BreedRepositoryImpl(
      dataSource: dataSource,
      networkInfo: networkInfo,
    );
  });

  group(
    'getBreeds',
    () {
      const tBreedModelList = [
        BreedInfoModel(
          id: ID('1'),
          name: 'test',
          temperament: 'test',
          lifeSpan: 'test',
          origin: 'test',
          image: 'test',
        ),
      ];

      List<BreedInfo> tBreedList = tBreedModelList;

      group(
        'device is online',
        () {
          test('should check if the device is online', () {
            networkInfo.runTestsOnline();
            when(() => dataSource.getBreeds()).thenAnswer(
              (_) async => tBreedModelList,
            );

            repository.getBreeds();

            verify(() => networkInfo.isConnected).called(1);
          });
        },
      );

      test(
        'should return data when the request is successful',
        () async {
          networkInfo.runTestsOnline();
          when(() => dataSource.getBreeds()).thenAnswer(
            (_) async => tBreedModelList,
          );

          final result = await repository.getBreeds();

          verify(() => dataSource.getBreeds()).called(1);
          expect(
            result,
            Result<List<BreedInfo>>.success(tBreedList),
          );
        },
      );

      test(
        'should return ServerFailure when the request has failed',
        () async {
          networkInfo.runTestsOnline();
          when(() => dataSource.getBreeds()).thenThrow(ServerException());

          final result = await repository.getBreeds();

          verify(() => dataSource.getBreeds()).called(1);

          expect(
            result,
            Result<List<BreedInfo>>.error(ServerFailure()),
          );
        },
      );

      test(
        'should return NetworkFailure when the user has no connection',
        () async {
          networkInfo.runTestsOffline();

          final result = await repository.getBreeds();

          verifyNever(() => dataSource.getBreeds()).called(0);
          expect(
            result,
            Result<List<BreedInfo>>.error(NetworkFailure()),
          );
        },
      );
    },
  );
}
