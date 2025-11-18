// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      status: json['status'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      type: $enumDecodeNullable(_$ApiErrorTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'type': _$ApiErrorTypeEnumMap[instance.type],
    };

const _$ApiErrorTypeEnumMap = {
  ApiErrorType.badRequest: 'badRequest',
  ApiErrorType.unauthorized: 'unauthorized',
  ApiErrorType.forbidden: 'forbidden',
  ApiErrorType.notFound: 'notFound',
  ApiErrorType.internalServer: 'internalServer',
  ApiErrorType.timeout: 'timeout',
  ApiErrorType.noInternet: 'noInternet',
  ApiErrorType.unknown: 'unknown',
};
