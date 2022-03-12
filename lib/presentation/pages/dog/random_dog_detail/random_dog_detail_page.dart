import 'package:dog_app/application/dog/random_dog/random_dog_bloc.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';

import 'package:dog_app/presentation/core/widgets/breed_info.dart';
import 'package:dog_app/presentation/core/widgets/download_image_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomDogDetailPage extends StatefulWidget {
  const RandomDogDetailPage({Key? key}) : super(key: key);

  @override
  _RandomDogDetailPageState createState() => _RandomDogDetailPageState();
}

class _RandomDogDetailPageState extends State<RandomDogDetailPage> {
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
                if (state is Loaded)
                  DownloadImageIconButton(url: state.dog.url),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Click here to load a random dog',
                  onPressed: () {
                    context.read<RandomDogBloc>().add(GetRandomDog());
                  },
                ),
              ],
            ),
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: BlocBuilder<RandomDogBloc, RandomDogState>(
        builder: (context, state) {
          if (state is Loaded) {
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
          } else if (state is Error) {
            return Center(child: Text(state.message));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
