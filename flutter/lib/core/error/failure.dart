import 'package:equatable/equatable.dart';

import 'exceptions.dart';

sealed class Failure extends Equatable {
  const Failure();

  factory Failure.client({
    required String message,
  }) =>
      _ClientFailure._(
        message: message,
      );

  factory Failure.server({
    required int statusCode,
    required String message,
  }) =>
      _ServerFailure._(
        statusCode: statusCode,
        message: message,
      );

  factory Failure.serverFromException(ServerException e) => _ServerFailure._(
        statusCode: e.statusCode,
        message: e.message,
      );
}

class _ClientFailure extends Failure {
  const _ClientFailure._({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class _ServerFailure extends Failure {
  const _ServerFailure._({
    required this.statusCode,
    required this.message,
  });

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [statusCode, message];
}
