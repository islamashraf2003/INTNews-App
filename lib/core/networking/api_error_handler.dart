import 'dart:io';
import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "Connection timeout",
            type: ApiErrorType.timeout,
          );

        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: "No internet connection",
            type: ApiErrorType.noInternet,
          );

        case DioExceptionType.badResponse:
          return _handleBackendError(error.response?.data);

        default:
          return ApiErrorModel(
            message: "Unknown Dio error",
            type: ApiErrorType.unknown,
          );
      }
    }

    if (error is SocketException) {
      return ApiErrorModel(
        message: "No internet connection",
        type: ApiErrorType.noInternet,
      );
    }

    return ApiErrorModel(
      message: "Unexpected error occurred",
      type: ApiErrorType.unknown,
    );
  }

  static ApiErrorModel _handleBackendError(dynamic data) {
    return ApiErrorModel(
      status: data["status"],
      code: data["code"],
      message: data["message"],
      type: ApiErrorType.badRequest,
    );
  }
}
