import 'package:equatable/equatable.dart';

class ApiResult extends Equatable {
  final List<Map<String, dynamic>> response;

  const ApiResult._(this.response);

  factory ApiResult.fromList(
    List<dynamic> decodedResponse,
  ) =>
      ApiResult._(
        decodedResponse
            .map((response) => response as Map<String, dynamic>)
            .toList(),
      );

  @override
  List<Object?> get props => [response];
}
