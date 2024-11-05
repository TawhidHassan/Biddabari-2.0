// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AffilitaeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AffilitaeResponse _$AffilitaeResponseFromJson(Map<String, dynamic> json) =>
    AffilitaeResponse(
      json['success'],
      json['message'] as String?,
      (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..affiliateRegister = json['affiliateRegister'] == null
        ? null
        : User.fromJson(json['affiliateRegister'] as Map<String, dynamic>);

Map<String, dynamic> _$AffilitaeResponseToJson(AffilitaeResponse instance) =>
    <String, dynamic>{
      'affiliateRegister': instance.affiliateRegister,
      'success': instance.success,
      'message': instance.message,
      'courses': instance.courses,
    };
