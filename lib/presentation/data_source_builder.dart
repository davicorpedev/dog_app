import 'package:dog_app/data/core/client/api_client.dart';
import 'package:dog_app/data/datasources/breed_data_source.dart';
import 'package:dog_app/data/datasources/dog_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DataSourceBuilder extends StatelessWidget {
  final ApiClient apiClient;
  final Widget child;

  const DataSourceBuilder({
    Key? key,
    required this.apiClient,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<DogDataSourceImpl>(
          create: (context) => DogDataSourceImpl(client: apiClient),
        ),
        RepositoryProvider<BreedDataSourceImpl>(
          create: (context) => BreedDataSourceImpl(client: apiClient),
        ),
      ],
      child: child,
    );
  }
}
