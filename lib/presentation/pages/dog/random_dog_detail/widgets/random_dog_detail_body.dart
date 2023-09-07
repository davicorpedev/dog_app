import 'package:dog_app/application/pages/random_dog/random_dog_bloc.dart';
import 'package:dog_app/presentation/utils/map_failure_to_message.dart';
import 'package:dog_app/presentation/widgets/breed_info_layout.dart';
import 'package:dog_app/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        .map((e) => BreedInfoLayout(breed: e))
                        .toList(),
                  ),
                ],
              ),
            );
          } else if (state is RandomDogErrorState) {
            return Center(child: Text(mapFailureToMessage(state.failure)));
          }

          return const Center(child: CustomCircularProgressIndicator());
        },
      ),
    );
  }
}
