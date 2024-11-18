// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineModel _$RoutineModelFromJson(Map<String, dynamic> json) => RoutineModel(
      (json['id'] as num?)?.toInt(),
      (json['course_id'] as num?)?.toInt(),
      (json['user_id'] as num?)?.toInt(),
      (json['parent_model_id'] as num?)?.toInt(),
      json['day'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['message'] as String?,
      json['date_time'] as String?,
      json['type'] as String?,
      json['content_name'] as String?,
      json['room'],
      json['note'],
      (json['status'] as num?)?.toInt(),
      (json['is_seen'] as num?)?.toInt(),
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$RoutineModelToJson(RoutineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.course_id,
      'user_id': instance.user_id,
      'parent_model_id': instance.parent_model_id,
      'day': instance.day,
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
      'date_time': instance.date_time,
      'type': instance.type,
      'content_name': instance.content_name,
      'room': instance.room,
      'note': instance.note,
      'status': instance.status,
      'is_seen': instance.is_seen,
      'created_at': instance.created_at?.toIso8601String(),
    };
