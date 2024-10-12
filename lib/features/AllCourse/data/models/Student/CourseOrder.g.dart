// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseOrder _$CourseOrderFromJson(Map<String, dynamic> json) => CourseOrder(
      json['id'] as num?,
      json['parent_model_id'] as num?,
      json['user_id'] as num?,
      json['status'] as String?,
      json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseOrderToJson(CourseOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_model_id': instance.parent_model_id,
      'user_id': instance.user_id,
      'status': instance.status,
      'course': instance.course,
    };
