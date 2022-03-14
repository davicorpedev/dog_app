import 'package:equatable/equatable.dart';

class ApiResult extends Equatable {
  final List<Map<String, dynamic>> response;

  const ApiResult._({required this.response});

  factory ApiResult.fromJson(
    Map<String, dynamic> decodedResponse,
  ) {
    return ApiResult._(
      response: [decodedResponse],
    );
  }

  factory ApiResult.fromList(
    List<dynamic> decodedResponse,
  ) {
    return ApiResult._(
      response: decodedResponse.map((e) => e as Map<String, dynamic>).toList(),
    );
  }

  @override
  List<Object?> get props => [response];
}
