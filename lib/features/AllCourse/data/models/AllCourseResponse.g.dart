// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AllCourseResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCourseResponse _$AllCourseResponseFromJson(Map<String, dynamic> json) =>
    AllCourseResponse(
      (json['courseCategories'] as List<dynamic>?)
          ?.map((e) => CourseCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['courses'] == null
          ? null
          : AllCourseModel.fromJson(json['courses'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllCourseResponseToJson(AllCourseResponse instance) =>
    <String, dynamic>{
      'courseCategories': instance.courseCategories,
      'courses': instance.courses,
    };
