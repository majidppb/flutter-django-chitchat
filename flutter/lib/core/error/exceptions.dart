class ServerException implements Exception {
  const ServerException({
    required this.statusCode,
    required this.message,
  });

  final String message;
  final int statusCode;
}
