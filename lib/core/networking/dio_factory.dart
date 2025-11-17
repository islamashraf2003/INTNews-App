import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      log("🛠️ Initializing Dio");
      _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      _addInterceptors();
    }
    return _dio!;
  }

  static void setTokenIntoHeaderAfterLogin(String accessToken) {
    if (_dio != null) {
      _dio!.options.headers["Authorization"] = "Bearer $accessToken";
      log("✅ Authorization header updated after login: Bearer $accessToken");
    }
  }

  static void _addInterceptors() {
    _dio?.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    ]);
  }
}
