import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

enum ApiErrorType {
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  internalServer,
  timeout,
  noInternet,
  unknown,
}

@JsonSerializable()
class ApiErrorModel {
  final String? status;
  final String? code;
  final String? message;

  final ApiErrorType? type;

  ApiErrorModel({this.status, this.code, this.message, this.type});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getReadableMessage() {
    return message ?? "Something went wrong";
  }
}
