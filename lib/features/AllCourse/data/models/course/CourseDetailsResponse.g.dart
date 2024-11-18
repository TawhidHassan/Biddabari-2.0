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
      json['courseSec'] == null
          ? null
          : Course.fromJson(json['courseSec'] as Map<String, dynamic>),
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => RoutineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalStudentEnrollments'] as num?,
      json['courseEnrollStatus'] as String?,
    );

Map<String, dynamic> _$CourseDetailsResponseToJson(
        CourseDetailsResponse instance) =>
    <String, dynamic>{
      'course': instance.course,
      'courseSec': instance.courseSec,
      'reviews': instance.reviews,
      'totalStudentEnrollments': instance.totalStudentEnrollments,
      'courseEnrollStatus': instance.courseEnrollStatus,
    };
