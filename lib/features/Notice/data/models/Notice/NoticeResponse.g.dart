// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NoticeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeResponse _$NoticeResponseFromJson(Map<String, dynamic> json) =>
    NoticeResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['notices'] as List<dynamic>?)
          ?.map((e) => Notice.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['popupNotification'] == null
          ? null
          : Notice.fromJson(json['popupNotification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NoticeResponseToJson(NoticeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'notices': instance.notices,
      'popupNotification': instance.popupNotification,
    };
