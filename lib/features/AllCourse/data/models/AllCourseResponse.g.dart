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
    );

Map<String, dynamic> _$AllCourseResponseToJson(AllCourseResponse instance) =>
    <String, dynamic>{
      'courseCategories': instance.courseCategories,
    };
