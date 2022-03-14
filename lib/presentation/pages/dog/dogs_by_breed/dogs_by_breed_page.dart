import 'package:dog_app/application/dog/dogs_by_breed/dogs_by_breed_bloc.dart';
import 'package:dog_app/domain/core/entitites/breed.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:dog_app/presentation/core/widgets/breed_info.dart';
import 'package:dog_app/presentation/pages/dog/dogs_by_breed/widgets/dog_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogByBreedPage extends StatelessWidget {
  final Breed breed;

  const DogByBreedPage({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(floating: true),
          SliverToBoxAdapter(
            child: BreedInfo(breed: breed),
          ),
          BlocProvider(
            create: (context) => DogsByBreedBloc(
              breedId: breed.id,
              repository: RepositoryProvider.of<DogRepositoryImpl>(context),
            ),
            child: BlocBuilder<DogsByBreedBloc, DogsByBreedState>(
              builder: (context, state) {
                if (state is DogsByBreedLoadedState) {
                  return SliverToBoxAdapter(child: DogGrid(dogs: state.dogs));
                } else if (state is DogsByBreedErrorState) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                }

                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
