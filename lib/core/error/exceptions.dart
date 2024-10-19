class ServerException implements Exception {
  final String message;
  ServerException([this.message = "An error occurred on the server"]);
}

class CancelledException implements Exception {
  final String message;
  CancelledException([this.message = "Request was cancelled"]);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "Failed to connect to the network"]);
}

class UnknownException implements Exception {
  final String message;
  UnknownException([this.message = "An unknown error occurred"]);
}
