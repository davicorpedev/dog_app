import 'package:dog_app/application/breed/breed_bloc.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/presentation/pages/breed/widgets/breed_grid.dart';
import 'package:dog_app/presentation/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsPage extends StatelessWidget {
  const BreedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            title: Text(
              'Look for your dog',
              style: Theme.of(context).textTheme.headline5,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'Return to Home',
                onPressed: () {
                  AppNavigator.pop(context);
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Click in a breed to see all the dogs of that breed',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          BlocProvider(
            create: (context) => BreedBloc(
              repository: RepositoryProvider.of<BreedRepository>(context),
            ),
            child: BlocBuilder<BreedBloc, BreedState>(
              builder: (context, state) {
                if (state is BreedLoadedState) {
                  return SliverToBoxAdapter(
                    child: BreedGrid(breeds: state.breeds),
                  );
                } else if (state is BreedErrorState) {
                  return SliverFillRemaining(
                    child: Center(child: Text(state.message)),
                  );
                }

                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}