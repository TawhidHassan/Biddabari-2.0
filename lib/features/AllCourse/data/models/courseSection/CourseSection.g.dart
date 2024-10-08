// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseSection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSection _$CourseSectionFromJson(Map<String, dynamic> json) =>
    CourseSection(
      json['id'] as num?,
      json['course_id'] as num?,
      json['title'] as String?,
      json['available_at'] as String?,
      json['is_paid'] as num?,
      json['status'] as num?,
      (json['course_section_contents'] as List<dynamic>?)
          ?.map((e) => CourseSectionContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseSectionToJson(CourseSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.course_id,
      'title': instance.title,
      'available_at': instance.available_at,
      'is_paid': instance.is_paid,
      'status': instance.status,
      'course_section_contents': instance.course_section_contents,
    };
