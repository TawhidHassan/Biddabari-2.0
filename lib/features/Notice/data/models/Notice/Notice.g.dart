// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
      json['id'] as num?,
      json['notice_category_id'] as num?,
      json['title'] as String?,
      json['image'] as String?,
      json['body'] as String?,
      json['type'] as String?,
      json['slug'] as String?,
      json['status'] as int?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'id': instance.id,
      'notice_category_id': instance.notice_category_id,
      'title': instance.title,
      'image': instance.image,
      'body': instance.body,
      'type': instance.type,
      'slug': instance.slug,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
