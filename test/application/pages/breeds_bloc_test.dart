import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/pages/breeds/breeds_bloc.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
import 'package:dog_app/domain/entities/id.dart';
import 'package:dog_app/domain/entities/result.dart';
import 'package:dog_app/domain/error/failures.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBreedRepository extends Mock implements BreedRepository {}

void main() {
  late MockBreedRepository repository;

  setUp(() {
    repository = MockBreedRepository();
  });

  group('GetBreeds', () {
    const tBreedList = [
      BreedInfo(
        image: 'test',
        id: ID('1'),
        name: 'test',
        temperament: 'test',
        lifeSpan: 'test',
        origin: 'test',
      ),
    ];

    blocTest<BreedsBloc, BreedsState>(
      'should get the data from the repository',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => const Result<List<BreedInfo>>.success(tBreedList),
        );
      },
      build: () => BreedsBloc(repository: repository),
      verify: (bloc) {
        verify(() => repository.getBreeds()).called(1);
      },
    );

    blocTest<BreedsBloc, BreedsState>(
      'should emit [Loading, Loaded] when the request has succeded',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => const Result<List<BreedInfo>>.success(tBreedList),
        );
      },
      build: () => BreedsBloc(repository: repository),
      expect: () => [
        const BreedsLoadingState(),
        const BreedsLoadedState(breeds: tBreedList),
      ],
    );

    blocTest<BreedsBloc, BreedsState>(
      'should emit [Loading, Loaded] when the request has failed',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => Result<List<BreedInfo>>.error(ServerFailure()),
        );
      },
      build: () => BreedsBloc(repository: repository),
      expect: () => [
        const BreedsLoadingState(),
        BreedsErrorState(failure: ServerFailure()),
      ],
    );
  });
}
