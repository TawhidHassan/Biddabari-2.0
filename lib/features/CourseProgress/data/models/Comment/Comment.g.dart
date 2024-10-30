// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['id'] as num?,
      json['user_id'] as num?,
      json['parent_model_id'] as num?,
      json['type'] as String?,
      json['name'] as String?,
      json['message'] as String?,
      json['created_at'] as String?,
      json['is_seen'] as num?,
      json['status'] as num?,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'parent_model_id': instance.parent_model_id,
      'type': instance.type,
      'name': instance.name,
      'message': instance.message,
      'created_at': instance.created_at,
      'is_seen': instance.is_seen,
      'status': instance.status,
      'user': instance.user,
    };
