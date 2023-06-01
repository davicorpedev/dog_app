import 'package:auto_route/auto_route.dart';
import 'package:dog_app/domain/entities/breed.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/navigation/flows/breeds_flow.dart';
import 'package:dog_app/presentation/pages/breed/breeds_page.dart';
import 'package:dog_app/presentation/pages/dog/dog_detail/dog_detail_page.dart';
import 'package:dog_app/presentation/pages/dog/dogs_by_breed/dogs_by_breed_page.dart';
import 'package:dog_app/presentation/pages/dog/random_dog_detail/random_dog_detail_page.dart';
import 'package:dog_app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: RandomDogDetailRoute.page),
        AutoRoute(
          page: BreedsFlowRoute.page,
          children: [
            AutoRoute(page: BreedsRoute.page),
            AutoRoute(page: DogsByBreedRoute.page),
            AutoRoute(
              page: DogDetailRoute.page,
              fullscreenDialog: true,
            ),
          ],
        ),
      ];
}
