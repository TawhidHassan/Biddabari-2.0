// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExamCategorie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamCategorie _$ExamCategorieFromJson(Map<String, dynamic> json) =>
    ExamCategorie(
      id: json['id'] as int?,
      name: json['name'] as String?,
      parentId: json['parent_id'] as int?,
      note: json['note'] as String?,
      image: json['image'] as String?,
      slug: json['slug'] as String?,
      order: json['order'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      batch_exams: (json['batch_exams'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamCategorieToJson(ExamCategorie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parent_id': instance.parentId,
      'note': instance.note,
      'image': instance.image,
      'slug': instance.slug,
      'order': instance.order,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'batch_exams': instance.batch_exams,
    };
