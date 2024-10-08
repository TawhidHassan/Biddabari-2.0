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
    );

Map<String, dynamic> _$CourseCategoryResponseToJson(
        CourseCategoryResponse instance) =>
    <String, dynamic>{
      'courseCategory': instance.courseCategory,
    };
