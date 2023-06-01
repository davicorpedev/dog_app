import 'package:auto_route/auto_route.dart';
import 'package:dog_app/application/navigation/breeds_flow/breeds_flow_cubit.dart';
import 'package:dog_app/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'BreedsFlowRoute')
class BreedsFlow extends StatefulWidget {
  const BreedsFlow({Key? key}) : super(key: key);

  @override
  State<BreedsFlow> createState() => _BreedsFlowState();
}

class _BreedsFlowState extends State<BreedsFlow> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedsFlowCubit(),
      child: BlocBuilder<BreedsFlowCubit, BreedsFlowState>(
        builder: (context, state) {
          return AutoRouter.declarative(
            routes: (handler) => _getPages(state),
            onPopRoute: (_, __) {
              context.read<BreedsFlowCubit>().back();
            },
          );
        },
      ),
    );
  }

  List<PageRouteInfo> _getPages(BreedsFlowState state) {
    List<PageRouteInfo> pages = [const BreedsRoute()];

    switch (state.currentScreen) {
      case BreedsFlowScreen.breeds:
        break;
      case BreedsFlowScreen.dogsByBreed:
        pages.add(DogsByBreedRoute(breed: state.selectedBreed!));
        break;

      case BreedsFlowScreen.dogDetails:
        pages.add(DogsByBreedRoute(breed: state.selectedBreed!));
        pages.add(DogDetailRoute(dog: state.selectedDog!));
        break;
    }

    return pages;
  }
}
