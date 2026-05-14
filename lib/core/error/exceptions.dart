class ServerException implements Exception {
  const ServerException(this.message);

  final String message;
}

class CacheException implements Exception {
  const CacheException([this.message = 'Cache error']);

  final String message;
}

class NetworkException implements Exception {
  const NetworkException([this.message = 'No internet connection']);

  final String message;
}
