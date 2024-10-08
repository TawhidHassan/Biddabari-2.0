// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['success'],
      json['statusCode'] as num?,
      json['version'] as String?,
      json['message'] as String?,
      json['error'],
      json['token'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['mobileNumber'] as String?,
      json['profilePicture'] as String?,
      json['chefId'] as String?,
      json['type'] as String?,
      json['rating'] as num?,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['auth_token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'version': instance.version,
      'message': instance.message,
      'error': instance.error,
      'token': instance.token,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'profilePicture': instance.profilePicture,
      'chefId': instance.chefId,
      'type': instance.type,
      'rating': instance.rating,
      'user': instance.user,
      'auth_token': instance.auth_token,
    };
