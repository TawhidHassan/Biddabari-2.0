// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseCategoryData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseCategoryData _$CourseCategoryDataFromJson(Map<String, dynamic> json) =>
    CourseCategoryData(
      id: json['id'] as num?,
      name: json['name'] as String?,
      parentId: json['parentId'] as String?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
      slug: json['slug'] as String?,
      status: json['status'] as String?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      course_categories: (json['course_categories'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseCategoryDataToJson(CourseCategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'image': instance.image,
      'icon': instance.icon,
      'slug': instance.slug,
      'status': instance.status,
      'courses': instance.courses,
      'course_categories': instance.course_categories,
    };
