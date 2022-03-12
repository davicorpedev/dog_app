import 'package:dog_app/application/dog/random_dog/random_dog_bloc.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';

import 'package:dog_app/presentation/core/widgets/breed_info.dart';
import 'package:dog_app/presentation/core/widgets/download_image_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomDogDetailPage extends StatelessWidget {
  const RandomDogDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomDogBloc>(
      create: (context) => RandomDogBloc(
        repository: RepositoryProvider.of<DogRepository>(context),
      ),
      child: BlocBuilder<RandomDogBloc, RandomDogState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                if (state is RandomDogLoadedState)
                  DownloadImageIconButton(url: state.dog.url),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Click here to load a random dog',
                  onPressed: () {
                    context.read<RandomDogBloc>().add(GetRandomDogEvent());
                  },
                ),
              ],
            ),
            body: const RandomDogDetailBody(),
          );
        },
      ),
    );
  }
}

class RandomDogDetailBody extends StatelessWidget {
  const RandomDogDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<RandomDogBloc, RandomDogState>(
        builder: (context, state) {
          if (state is RandomDogLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Hero(
                      tag: state.dog.id,
                      child: Image.network(state.dog.url),
                    ),
                  ),
                  Column(
                    children: state.dog.breeds
                        .map((e) => BreedInfo(breed: e))
                        .toList(),
                  ),
                ],
              ),
            );
          } else if (state is RandomDogErrorState) {
            return Center(child: Text(state.message));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
