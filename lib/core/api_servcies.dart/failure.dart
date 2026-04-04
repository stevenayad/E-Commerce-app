import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServiveFailure extends Failure {
  ServiveFailure(String errMessage) : super(errMessage);

  factory ServiveFailure.fromDioError(DioError dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServiveFailure("Connection timeout With Apiserver");
      case DioExceptionType.sendTimeout:
        return ServiveFailure("Send timeout With Apiserver");
      case DioExceptionType.receiveTimeout:
        return ServiveFailure("Recive timeout With Apiserver");
      case DioExceptionType.badCertificate:
        return ServiveFailure("lk");
      case DioExceptionType.badResponse:
        return ServiveFailure.badResponse(
          dioerror.response!.statusCode!,
          dioerror.response!.data!,
        );
      case DioExceptionType.cancel:
        return ServiveFailure("Request with api server was cancled");
      case DioExceptionType.connectionError:
        return ServiveFailure("Connection error");
      case DioExceptionType.unknown:
        if (dioerror.message!.contains("SocketException")) {
          return ServiveFailure("No Internet Connection");
        }
        return ServiveFailure("Un Expected error , please try again");

      default:
        return ServiveFailure("Opps error");
    }
  }

  factory ServiveFailure.badResponse(int? statscode, dynamic respone) {
    String errorMessage = "An unknown error occurred.";

    if (statscode == 400 || statscode == 401 || statscode == 403) {
      if (respone is Map<String, dynamic>) {
        if (respone.containsKey('error') && respone['error'] is Map) {
          if (respone['error'].containsKey('message')) {
            errorMessage = respone['error']['message'];
          }
        } else if (respone.containsKey('message')) {
          errorMessage = respone['message'];
        } else if (respone.containsKey('errors')) {
          if (respone['errors'] is Map) {
            errorMessage = respone['errors'].values.first.first;
          } else {
            errorMessage = "Invalid data provided.";
          }
        }
      }
      return ServiveFailure(errorMessage);
    } else if (statscode == 404) {
      return ServiveFailure("Your request was not found, please try again.");
    } else if (statscode == 500) {
      return ServiveFailure("Internal server error, please try again later.");
    } else {
      return ServiveFailure("Oops, something went wrong!");
    }
  }
}
