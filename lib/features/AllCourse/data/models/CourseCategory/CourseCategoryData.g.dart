// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseCategoryData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseCategoryData _$CourseCategoryDataFromJson(Map<String, dynamic> json) =>
    CourseCategoryData(
      json['id'] as num?,
      json['category_id'] as num?,
      json['section_content_id'] as num?,
      json['exam_id'] as num?,
      json['type'] as String?,
      json['name'] as String?,
      json['parentId'] as String?,
      json['image'] as String?,
      json['second_image'] as String?,
      json['thumbnail'] as String?,
      json['icon'] as String?,
      json['slug'] as String?,
      json['status'] as String?,
      json['category_video'] == null
          ? null
          : Course.fromJson(json['category_video'] as Map<String, dynamic>),
      json['category_exam'] == null
          ? null
          : Course.fromJson(json['category_exam'] as Map<String, dynamic>),
      (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['course_categories'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseCategoryDataToJson(CourseCategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'section_content_id': instance.section_content_id,
      'exam_id': instance.exam_id,
      'type': instance.type,
      'name': instance.name,
      'parentId': instance.parentId,
      'image': instance.image,
      'second_image': instance.second_image,
      'thumbnail': instance.thumbnail,
      'icon': instance.icon,
      'slug': instance.slug,
      'status': instance.status,
      'category_video': instance.category_video,
      'category_exam': instance.category_exam,
      'courses': instance.courses,
      'course_categories': instance.course_categories,
    };
