// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'courses': instance.courses,
    };
