import 'package:json_annotation/json_annotation.dart';

enum ApiErrorType {
  badRequest, // 400
  unauthorized, // 401
  forbidden, // 403
  notFound, // 404
  internalServer, // 500
  timeout, // timeout error
  noInternet, // no connection
  unknown, // unexpected error
}

@JsonSerializable()
class ApiErrorModel {
  final int? statusCode;
  final String? error;
  final ApiErrorType? type;
  final List<String>? message;

  ApiErrorModel({this.statusCode, this.error, this.message, this.type});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    final dynamic msg = json['message'];

    final List<String>? messageList = msg == null
        ? null
        : msg is String
        ? [msg]
        : (msg as List).map((e) => e.toString()).toList();

    return ApiErrorModel(
      statusCode: json['statusCode'] as int?,
      error: json['error'] as String?,
      message: messageList,
    );
  }

  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'error': error,
    'message': message,
  };

  String getAllErrors() {
    if (message == null || message!.isEmpty) return 'Unknown error occurred';
    return message!.map((e) => '- $e').join('\n');
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
