import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:dog_app/application/breed/breed_bloc.dart';
import 'package:dog_app/domain/core/entitites/result.dart';
import 'package:dog_app/domain/core/error/failures.dart';
import 'package:dog_app/domain/entities/breed_data.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';

class MockBreedRepository extends Mock implements BreedRepository {}

void main() {
  late MockBreedRepository repository;

  setUp(() {
    repository = MockBreedRepository();
  });

  blocTest<BreedBloc, BreedState>(
    'initial state should be Empty',
    build: () => BreedBloc(repository: repository),
    verify: (bloc) {
      expect(bloc.state, Empty());
    },
  );

  group('GetBreeds', () {
    const tBreedList = [
      BreedData(
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
          (_) async => const Result<List<BreedData>>.success(tBreedList),
        );
      },
      build: () => BreedBloc(repository: repository),
      act: (bloc) => bloc.add(GetBreeds()),
      verify: (bloc) {
        verify(() => repository.getBreeds()).called(1);
      },
    );

    blocTest<BreedBloc, BreedState>(
      'should emit [Loading, Loaded] when the request has succeded',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => const Result<List<BreedData>>.success(tBreedList),
        );
      },
      build: () => BreedBloc(repository: repository),
      act: (bloc) => bloc.add(GetBreeds()),
      expect: () => [
        Loading(),
        Loaded(breeds: tBreedList),
      ],
    );

    blocTest<BreedBloc, BreedState>(
      'should emit [Loading, Loaded] when the request has failed',
      setUp: () {
        when(() => repository.getBreeds()).thenAnswer(
          (_) async => Result<List<BreedData>>.error(ServerFailure()),
        );
      },
      build: () => BreedBloc(repository: repository),
      act: (bloc) => bloc.add(GetBreeds()),
      expect: () => [
        Loading(),
        Error(message: serverFailureMessage),
      ],
    );
  });
}
