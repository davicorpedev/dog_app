// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    BreedsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BreedsPage());
    },
    RandomDogDetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RandomDogDetailPage());
    },
    DogDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DogDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DogDetailPage(key: args.key, dog: args.dog));
    },
    DogsByBreedRoute.name: (routeData) {
      final args = routeData.argsAs<DogsByBreedRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DogsByBreedPage(key: args.key, breed: args.breed));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(BreedsRoute.name, path: '/breeds-page'),
        RouteConfig(RandomDogDetailRoute.name, path: '/random-dog-detail-page'),
        RouteConfig(DogDetailRoute.name, path: '/dog-detail-page'),
        RouteConfig(DogsByBreedRoute.name, path: '/dogs-by-breed-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [BreedsPage]
class BreedsRoute extends PageRouteInfo<void> {
  const BreedsRoute() : super(BreedsRoute.name, path: '/breeds-page');

  static const String name = 'BreedsRoute';
}

/// generated route for
/// [RandomDogDetailPage]
class RandomDogDetailRoute extends PageRouteInfo<void> {
  const RandomDogDetailRoute()
      : super(RandomDogDetailRoute.name, path: '/random-dog-detail-page');

  static const String name = 'RandomDogDetailRoute';
}

/// generated route for
/// [DogDetailPage]
class DogDetailRoute extends PageRouteInfo<DogDetailRouteArgs> {
  DogDetailRoute({Key? key, required Dog dog})
      : super(DogDetailRoute.name,
            path: '/dog-detail-page',
            args: DogDetailRouteArgs(key: key, dog: dog));

  static const String name = 'DogDetailRoute';
}

class DogDetailRouteArgs {
  const DogDetailRouteArgs({this.key, required this.dog});

  final Key? key;

  final Dog dog;

  @override
  String toString() {
    return 'DogDetailRouteArgs{key: $key, dog: $dog}';
  }
}

/// generated route for
/// [DogsByBreedPage]
class DogsByBreedRoute extends PageRouteInfo<DogsByBreedRouteArgs> {
  DogsByBreedRoute({Key? key, required Breed breed})
      : super(DogsByBreedRoute.name,
            path: '/dogs-by-breed-page',
            args: DogsByBreedRouteArgs(key: key, breed: breed));

  static const String name = 'DogsByBreedRoute';
}

class DogsByBreedRouteArgs {
  const DogsByBreedRouteArgs({this.key, required this.breed});

  final Key? key;

  final Breed breed;

  @override
  String toString() {
    return 'DogsByBreedRouteArgs{key: $key, breed: $breed}';
  }
}
