// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BatchExamSection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchExamSection _$BatchExamSectionFromJson(Map<String, dynamic> json) =>
    BatchExamSection(
      json['id'] as num?,
      json['course_id'] as num?,
      json['title'] as String?,
      json['available_at'] as String?,
      json['is_paid'] as num?,
      json['status'] as num?,
      (json['batch_exam_section_contents'] as List<dynamic>?)
          ?.map((e) => CourseSectionContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchExamSectionToJson(BatchExamSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.course_id,
      'title': instance.title,
      'available_at': instance.available_at,
      'is_paid': instance.is_paid,
      'status': instance.status,
      'batch_exam_section_contents': instance.batch_exam_section_contents,
    };
