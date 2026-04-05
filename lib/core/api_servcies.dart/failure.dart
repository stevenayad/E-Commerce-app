import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api_servcies.dart/api_response_parser.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServiveFailure extends Failure {
  ServiveFailure(String errMessage) : super(errMessage);

  factory ServiveFailure.fromDioError(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServiveFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServiveFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServiveFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServiveFailure('Invalid server certificate');
      case DioExceptionType.badResponse:
        final code = dioerror.response?.statusCode;
        final data = dioerror.response?.data;
        if (code != null && data != null) {
          return ServiveFailure.badResponse(code, data);
        }
        return ServiveFailure('Bad response from server');
      case DioExceptionType.cancel:
        return ServiveFailure('Request was cancelled');
      case DioExceptionType.connectionError:
        return ServiveFailure('Connection error');
      case DioExceptionType.unknown:
        final msg = dioerror.message ?? '';
        if (msg.contains('SocketException')) {
          return ServiveFailure('No internet connection');
        }
        return ServiveFailure('Unexpected error, please try again');
    }
  }

  factory ServiveFailure.badResponse(int? statusCode, dynamic response) {
    final parsed = parseBackendErrorMessage(response);
    if (parsed != null && parsed.isNotEmpty) {
      return ServiveFailure(parsed);
    }

    if (statusCode == 404) {
      return ServiveFailure('Resource not found.');
    }
    if (statusCode == 500) {
      return ServiveFailure('Internal server error, please try again later.');
    }
    return ServiveFailure('Something went wrong. Please try again.');
  }
}
