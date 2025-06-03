import 'package:dio/dio.dart';

abstract class Failures {
  final String message;
  Failures(this.message);
}

class ServerFailure extends Failures {
  ServerFailure(super.message);
  factory ServerFailure.fromDioExption(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with API server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with API server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate with API server");
      case DioExceptionType.badResponse:
        return ServerFailure("Bad response with API server");
      case DioExceptionType.cancel:
        return ServerFailure("Request to API server was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection error with API server");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected error, please try again!");
        default:
          return ServerFailure("Unexpected error, please try again!");
    }
  }
}
