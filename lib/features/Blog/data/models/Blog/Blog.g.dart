// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      json['id'] as num?,
      json['blog_category_id'] as num?,
      json['author_id'] as num?,
      json['is_featured'] as num?,
      json['hit_count'] as num?,
      json['status'] as num?,
      json['title'] as String?,
      json['sub_title'] as String?,
      json['video_url'] as String?,
      json['image'] as String?,
      json['body'] as String?,
      json['slug'] as String?,
      json['updated_at'] as String?,
      json['created_at'] as String?,
      json['blog_category'] == null
          ? null
          : Categorie.fromJson(json['blog_category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
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
    };
