// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      hasError: json['hasError'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      responseData: json['responseData'] == null
          ? null
          : Login.fromJson(json['responseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'hasError': instance.hasError,
      'errorMessage': instance.errorMessage,
      'responseData': instance.responseData,
    };
