import 'package:dog_app/application/random_dog/random_dog_bloc.dart';
import 'package:dog_app/domain/repositories/dog_repository.dart';
import 'package:dog_app/presentation/core/widgets/download_image_icon_button.dart';
import 'package:dog_app/presentation/pages/dog/random_dog_detail/widgets/random_dog_detail_body.dart';
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
