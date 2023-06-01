import 'package:auto_route/auto_route.dart';
import 'package:dog_app/application/pages/dogs_by_breed/dogs_by_breed_bloc.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:dog_app/presentation/widgets/breed_info_layout.dart';
import 'package:dog_app/presentation/pages/dog/dogs_by_breed/widgets/dog_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage<String>()
class DogsByBreedPage extends StatelessWidget {
  final Breed breed;

  const DogsByBreedPage({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
          ),
          SliverToBoxAdapter(
            child: BreedInfoLayout(breed: breed),
          ),
          BlocProvider(
            create: (context) => DogsByBreedBloc(
              breedID: breed.id,
              repository: RepositoryProvider.of<DogRepository>(context),
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
