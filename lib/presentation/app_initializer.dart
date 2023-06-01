import 'package:dog_app/application/pages/app_initializer/app_initializer_cubit.dart';
import 'package:dog_app/presentation/widgets/app_error.dart';
import 'package:dog_app/presentation/pages/app_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInitializer extends StatefulWidget {
  final Future<void> Function() initializeTasks;
  final WidgetBuilder initalizedBuilder;

  const AppInitializer({
    Key? key,
    required this.initializeTasks,
    required this.initalizedBuilder,
  }) : super(key: key);

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  late AppInitializerCubit cubit;

  @override
  void initState() {
    cubit = AppInitializerCubit();
    cubit.initializeTasks(widget.initializeTasks);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitializerCubit, AppInitializerState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is AppInitializerLoadedState) {
          return widget.initalizedBuilder(context);
        } else if (state is AppInitializerErrorState) {
          return AppSplash(
            child: AppError(
              description: 'Error while launching the App',
              refresh: () => cubit.initializeTasks(widget.initializeTasks),
            ),
          );
        }

        return const AppSplash();
      },
    );
  }
}
