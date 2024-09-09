import 'package:dio/dio.dart';
import 'package:prayer_app/core/utils/app_strings.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(AppStrings.connectionTimeOutError);

      case DioExceptionType.sendTimeout:
        return ServerFailure(AppStrings.sendTimeOutError);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppStrings.receiveTimeOutError);

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(AppStrings.cancelError);

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') == true) {
          return ServerFailure(AppStrings.noInternetError);
        }
        return ServerFailure(AppStrings.unexpectedError);
      default:
        return ServerFailure(AppStrings.unexpectedError);
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(AppStrings.notFoundError);
    } else if (statusCode == 500) {
      return ServerFailure(AppStrings.internalServerError);
    } else {
      return ServerFailure(AppStrings.unexpectedError);
    }
  }
}
