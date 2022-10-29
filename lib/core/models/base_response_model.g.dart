// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    BaseResponseModel(
      hasError: json['hasError'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      responseData: json['responseData'],
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{
      'hasError': instance.hasError,
      'errorMessage': instance.errorMessage,
      'responseData': instance.responseData,
    };
