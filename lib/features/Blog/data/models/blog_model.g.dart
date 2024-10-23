// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      json['name'] as String?,
    )
      ..id = json['id'] as num?
      ..blog_category_id = json['blog_category_id'] as num?
      ..author_id = json['author_id'] as num?
      ..is_featured = json['is_featured'] as num?
      ..hit_count = json['hit_count'] as num?
      ..status = json['status'] as num?
      ..title = json['title'] as String?
      ..sub_title = json['sub_title'] as String?
      ..video_url = json['video_url'] as String?
      ..image = json['image'] as String?
      ..body = json['body'] as String?
      ..slug = json['slug'] as String?
      ..updated_at = json['updated_at'] as String?
      ..created_at = json['created_at'] as String?
      ..blog_category = json['blog_category'] == null
          ? null
          : Categorie.fromJson(json['blog_category'] as Map<String, dynamic>);

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'id': instance.id,
      'blog_category_id': instance.blog_category_id,
      'author_id': instance.author_id,
      'is_featured': instance.is_featured,
      'hit_count': instance.hit_count,
      'status': instance.status,
      'title': instance.title,
      'sub_title': instance.sub_title,
      'video_url': instance.video_url,
      'image': instance.image,
      'body': instance.body,
      'slug': instance.slug,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'blog_category': instance.blog_category,
      'name': instance.name,
    };
