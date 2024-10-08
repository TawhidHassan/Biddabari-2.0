// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      (json['id'] as num?)?.toInt(),
      json['slug'] as String?,
      json['image'] as String?,
      (json['circular_category_id'] as num?)?.toInt(),
      (json['user_id'] as num?)?.toInt(),
      json['job_title'] as String?,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['post_title'] as String?,
      (json['vacancy'] as num?)?.toInt(),
      json['about'] as String?,
      json['description'] as String?,
      json['publish_date'] as String?,
      json['publish_date_timestamp'] as String?,
      json['expire_date'] as String?,
      json['expire_date_timestamp'] as String?,
      (json['status'] as num?)?.toInt(),
      (json['is_featured'] as num?)?.toInt(),
      (json['order'] as num?)?.toInt(),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'image': instance.image,
      'circular_category_id': instance.circularCategoryId,
      'user_id': instance.userId,
      'job_title': instance.jobTitle,
      'created_at': instance.createdAt?.toIso8601String(),
      'post_title': instance.postTitle,
      'vacancy': instance.vacancy,
      'about': instance.about,
      'description': instance.description,
      'publish_date': instance.publishDate,
      'publish_date_timestamp': instance.publishDateTimestamp,
      'expire_date': instance.expireDate,
      'expire_date_timestamp': instance.expireDateTimestamp,
      'status': instance.status,
      'is_featured': instance.isFeatured,
      'order': instance.order,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
