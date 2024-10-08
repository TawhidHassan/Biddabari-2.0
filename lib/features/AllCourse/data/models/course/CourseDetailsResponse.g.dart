// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailsResponse _$CourseDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    CourseDetailsResponse(
      json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      json['courseEnrollStatus'] as String?,
    );

Map<String, dynamic> _$CourseDetailsResponseToJson(
        CourseDetailsResponse instance) =>
    <String, dynamic>{
      'course': instance.course,
      'courseEnrollStatus': instance.courseEnrollStatus,
    };
