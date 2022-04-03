import 'package:auto_route/auto_route.dart';
import 'package:dog_app/domain/core/entitites/breed.dart';
import 'package:dog_app/domain/entities/dog.dart';
import 'package:dog_app/presentation/pages/breed/breeds_page.dart';
import 'package:dog_app/presentation/pages/dog/dog_detail/dog_detail_page.dart';
import 'package:dog_app/presentation/pages/dog/dogs_by_breed/dogs_by_breed_page.dart';
import 'package:dog_app/presentation/pages/dog/random_dog_detail/random_dog_detail_page.dart';
import 'package:dog_app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: BreedsPage),
    AutoRoute(page: RandomDogDetailPage),
    AutoRoute(page: DogDetailPage),
    AutoRoute(page: DogsByBreedPage),
  ],
)
class AppRouter extends _$AppRouter {}
