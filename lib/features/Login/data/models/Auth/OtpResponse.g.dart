// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OtpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResponse _$OtpResponseFromJson(Map<String, dynamic> json) => OtpResponse(
      json['success'] as bool?,
      json['status'],
      json['otp'],
      json['message'] as String?,
      json['user_status'] as String?,
      json['error'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$OtpResponseToJson(OtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'otp': instance.otp,
      'message': instance.message,
      'user_status': instance.user_status,
      'error': instance.error,
      'url': instance.url,
    };
