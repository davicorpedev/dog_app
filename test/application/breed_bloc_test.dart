import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app/application/breed/breed_bloc.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/breed_info.dart';
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
        id: 1,
        name: 'test',
        temperament: 'test',
        lifeSpan: 'test',
        origin: 'test',
      ),
    ];

    blocTest<BreedBloc, BreedState>(
      'should get the data from the repository',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => const Result<List<BreedInfo>>.success(tBreedList),
        );
      },
      build: () => BreedBloc(repository: repository),
      verify: (bloc) {
        verify(() => repository.getBreeds()).called(1);
      },
    );

    blocTest<BreedBloc, BreedState>(
      'should emit [Loading, Loaded] when the request has succeded',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => const Result<List<BreedInfo>>.success(tBreedList),
        );
      },
      build: () => BreedBloc(repository: repository),
      expect: () => [
        const BreedLoadingState(),
        const BreedLoadedState(breeds: tBreedList),
      ],
    );

    blocTest<BreedBloc, BreedState>(
      'should emit [Loading, Loaded] when the request has failed',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => Result<List<BreedInfo>>.error(ServerFailure()),
        );
      },
      build: () => BreedBloc(repository: repository),
      expect: () => [
        const BreedLoadingState(),
        const BreedErrorState(message: serverFailureMessage),
      ],
    );
  });
}
