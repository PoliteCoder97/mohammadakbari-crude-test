class ServerException implements Exception {
  final dynamic message;
  ServerException(this.message);
}
class NetworkException implements Exception {}
class UnAuthorizeException implements Exception {}
