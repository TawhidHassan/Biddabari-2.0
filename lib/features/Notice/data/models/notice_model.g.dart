// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
      json['name'] as String?,
    )
      ..id = json['id'] as num?
      ..notice_category_id = json['notice_category_id'] as num?
      ..title = json['title'] as String?
      ..image = json['image'] as String?
      ..body = json['body'] as String?
      ..type = json['type'] as String?
      ..slug = json['slug'] as String?
      ..status = (json['status'] as num?)?.toInt()
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?;

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
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
      'name': instance.name,
    };
