import 'package:auto_route/auto_route.dart';
import 'package:dog_app/application/pages/breeds/breeds_bloc.dart';
import 'package:dog_app/domain/repositories/breed_repository.dart';
import 'package:dog_app/presentation/navigation/navigator.dart';
import 'package:dog_app/presentation/pages/breed/widgets/breed_grid.dart';
import 'package:dog_app/presentation/utils/map_failure_to_message.dart';
import 'package:dog_app/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage<String>()
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
              style: Theme.of(context).textTheme.headlineSmall,
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
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          BlocProvider(
            create: (context) => BreedsBloc(
              repository: RepositoryProvider.of<BreedRepository>(context),
            ),
            child: BlocBuilder<BreedsBloc, BreedsState>(
              builder: (context, state) {
                if (state is BreedsLoadedState) {
                  return SliverToBoxAdapter(
                    child: BreedGrid(breeds: state.breeds),
                  );
                } else if (state is BreedsErrorState) {
                  return SliverFillRemaining(
                    child:
                        Center(child: Text(mapFailureToMessage(state.failure))),
                  );
                }

                return const SliverFillRemaining(
                  child: Center(child: CustomCircularProgressIndicator()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
