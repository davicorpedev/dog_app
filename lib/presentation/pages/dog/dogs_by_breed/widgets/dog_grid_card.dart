import 'package:dog_app/application/navigation/breeds_flow/breeds_flow_cubit.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogGridCard extends StatelessWidget {
  final Dog dog;

  const DogGridCard({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () {
          context.read<BreedsFlowCubit>().openDogDetails(dog);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          child: Hero(
            tag: dog.id,
            child: CustomCachedNetworkImage(imageURL: dog.url),
          ),
        ),
      ),
    );
  }
}
