// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      id: json['id'] as int?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      role: json['role'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
      isVerified: json['isVerified'] as bool?,
      jwtToken: json['jwtToken'] as String?,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'role': instance.role,
      'created': instance.created,
      'updated': instance.updated,
      'isVerified': instance.isVerified,
      'jwtToken': instance.jwtToken,
    };
