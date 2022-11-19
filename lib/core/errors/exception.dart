import 'dart:async';

class BaseException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  BaseException(this.message, [this.stackTrace]);

  @override
  String toString() => message.toString();
}

class ServerException extends BaseException {
  final dynamic error;
  final int statusCode;
  final String endPointUrl;
  ServerException({
    required String message,
    StackTrace? stackTrace,
    required this.error,
    required this.endPointUrl,
    required this.statusCode,
  }) : super(message, stackTrace);
}

class AppTimeoutException extends TimeoutException {
  AppTimeoutException(super.message, [super.duration]);
}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}
