// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BreedsFlowRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreedsFlow(),
      );
    },
    BreedsRoute.name: (routeData) {
      return AutoRoutePage<String>(
        routeData: routeData,
        child: const BreedsPage(),
      );
    },
    DogsByBreedRoute.name: (routeData) {
      final args = routeData.argsAs<DogsByBreedRouteArgs>();
      return AutoRoutePage<String>(
        routeData: routeData,
        child: DogsByBreedPage(
          key: args.key,
          breed: args.breed,
        ),
      );
    },
    DogDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DogDetailRouteArgs>();
      return AutoRoutePage<String>(
        routeData: routeData,
        child: DogDetailPage(
          key: args.key,
          dog: args.dog,
        ),
      );
    },
    RandomDogDetailRoute.name: (routeData) {
      return AutoRoutePage<String>(
        routeData: routeData,
        child: const RandomDogDetailPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<String>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [BreedsFlow]
class BreedsFlowRoute extends PageRouteInfo<void> {
  const BreedsFlowRoute({List<PageRouteInfo>? children})
      : super(
          BreedsFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreedsFlowRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BreedsPage]
class BreedsRoute extends PageRouteInfo<void> {
  const BreedsRoute({List<PageRouteInfo>? children})
      : super(
          BreedsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreedsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DogsByBreedPage]
class DogsByBreedRoute extends PageRouteInfo<DogsByBreedRouteArgs> {
  DogsByBreedRoute({
    Key? key,
    required Breed breed,
    List<PageRouteInfo>? children,
  }) : super(
          DogsByBreedRoute.name,
          args: DogsByBreedRouteArgs(
            key: key,
            breed: breed,
          ),
          initialChildren: children,
        );

  static const String name = 'DogsByBreedRoute';

  static const PageInfo<DogsByBreedRouteArgs> page =
      PageInfo<DogsByBreedRouteArgs>(name);
}

class DogsByBreedRouteArgs {
  const DogsByBreedRouteArgs({
    this.key,
    required this.breed,
  });

  final Key? key;

  final Breed breed;

  @override
  String toString() {
    return 'DogsByBreedRouteArgs{key: $key, breed: $breed}';
  }
}

/// generated route for
/// [DogDetailPage]
class DogDetailRoute extends PageRouteInfo<DogDetailRouteArgs> {
  DogDetailRoute({
    Key? key,
    required Dog dog,
    List<PageRouteInfo>? children,
  }) : super(
          DogDetailRoute.name,
          args: DogDetailRouteArgs(
            key: key,
            dog: dog,
          ),
          initialChildren: children,
        );

  static const String name = 'DogDetailRoute';

  static const PageInfo<DogDetailRouteArgs> page =
      PageInfo<DogDetailRouteArgs>(name);
}

class DogDetailRouteArgs {
  const DogDetailRouteArgs({
    this.key,
    required this.dog,
  });

  final Key? key;

  final Dog dog;

  @override
  String toString() {
    return 'DogDetailRouteArgs{key: $key, dog: $dog}';
  }
}

/// generated route for
/// [RandomDogDetailPage]
class RandomDogDetailRoute extends PageRouteInfo<void> {
  const RandomDogDetailRoute({List<PageRouteInfo>? children})
      : super(
          RandomDogDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'RandomDogDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
