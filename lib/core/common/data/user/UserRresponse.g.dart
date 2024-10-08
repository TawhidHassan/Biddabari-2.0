// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserRresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRresponse _$UserRresponseFromJson(Map<String, dynamic> json) =>
    UserRresponse(
      json['success'] as bool?,
      json['student'] == null
          ? null
          : User.fromJson(json['student'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRresponseToJson(UserRresponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'student': instance.student,
      'user': instance.user,
    };
