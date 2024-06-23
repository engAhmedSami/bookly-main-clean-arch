import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return ServerFailure("Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout in connection with API server");
      case DioExceptionType.unknown:
        return ServerFailure(
            "Connection to API server failed due to internet connection");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection Error");
      default:
        return ServerFailure("Something went wrong");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic respionse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(respionse['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure(
          'there is problem in server, please try again later');
    } else if (statusCode == 404) {
      return ServerFailure(" Server not found , please try again later");
    } else {
      return ServerFailure("Something went wrong");
    }
  }
}
