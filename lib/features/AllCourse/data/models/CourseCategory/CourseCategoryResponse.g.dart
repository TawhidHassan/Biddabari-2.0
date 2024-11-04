// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseCategoryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseCategoryResponse _$CourseCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    CourseCategoryResponse(
      json['courseCategory'] == null
          ? null
          : CourseCategoryData.fromJson(
              json['courseCategory'] as Map<String, dynamic>),
      (json['courseCategories'] as List<dynamic>?)
          ?.map((e) => CourseCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..free_class_videos = (json['free_class_videos'] as List<dynamic>?)
          ?.map((e) => CourseCategoryData.fromJson(e as Map<String, dynamic>))
          .toList()
      ..free_exams = (json['free_exams'] as List<dynamic>?)
          ?.map((e) => CourseCategoryData.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CourseCategoryResponseToJson(
        CourseCategoryResponse instance) =>
    <String, dynamic>{
      'courseCategory': instance.courseCategory,
      'courseCategories': instance.courseCategories,
      'free_class_videos': instance.free_class_videos,
      'free_exams': instance.free_exams,
    };
