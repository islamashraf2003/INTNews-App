import 'dart:io';
import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    //  Dio errors (network, HTTP, timeout, etc.)
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            error: "Connection timeout, please try again.",
            type: ApiErrorType.timeout,
          );

        case DioExceptionType.connectionError:
          return ApiErrorModel(
            error: "No internet connection.",
            message: ["Connection timeout, please try again."],
            type: ApiErrorType.noInternet,
          );
        case DioExceptionType.badResponse:
          return _handelError(error.response?.data);

        default:
          return ApiErrorModel(
            error: "Something went wrong. Please try again.",
            type: ApiErrorType.unknown,
          );
      }
    }

    // 🔹 SocketException → no internet
    if (error is SocketException) {
      return ApiErrorModel(
        error: "No internet connection.",
        type: ApiErrorType.noInternet,
      );
    }

    // 🔹 Fallback for unexpected errors
    return ApiErrorModel(
      error: "Unexpected error occurred.",
      type: ApiErrorType.unknown,
    );
  }

  /// Handles mapping HTTP status codes to ApiErrorType
  static ApiErrorModel _handelError(dynamic data) {
    final dynamic msg = data["message"];
    final List<String>? messageList =
        msg == null
            ? null
            : msg is String
            ? [msg]
            : (msg as List).map((e) => e.toString()).toList();

    return ApiErrorModel(
      message: messageList,
      error: data["error"],
      statusCode: data["statusCode"],
    );
  }
}

/*
{
  "message": [
    "email should not be empty",
    "email must be an email",
    "password should not be empty"
  ],
  "error": "Bad Request",
  "statusCode": 400
}
*/
