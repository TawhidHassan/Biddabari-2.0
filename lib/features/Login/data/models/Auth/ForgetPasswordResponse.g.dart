// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForgetPasswordResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponse(
      json['success'] as String?,
      json['message'] as String?,
      json['encoded_otp'] as String?,
      json['mobile'] as String?,
      json['otp'] as num?,
      json['error'] as String?,
      json['errors'] == null
          ? null
          : ErrorModel.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'encoded_otp': instance.encoded_otp,
      'mobile': instance.mobile,
      'otp': instance.otp,
      'error': instance.error,
      'errors': instance.errors,
    };
