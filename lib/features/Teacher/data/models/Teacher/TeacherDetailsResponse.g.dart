// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TeacherDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherDetailsResponse _$TeacherDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    TeacherDetailsResponse(
      json['teacher'] == null
          ? null
          : User.fromJson(json['teacher'] as Map<String, dynamic>),
      (json['latestCourses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherDetailsResponseToJson(
        TeacherDetailsResponse instance) =>
    <String, dynamic>{
      'teacher': instance.teacher,
      'latestCourses': instance.latestCourses,
    };
