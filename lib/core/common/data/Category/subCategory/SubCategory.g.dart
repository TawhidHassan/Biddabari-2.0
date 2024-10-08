// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      json['id'] as num?,
      json['name'] as String?,
      json['parentId'] as String?,
      json['image'] as String?,
      json['icon'] as String?,
      json['slug'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'image': instance.image,
      'icon': instance.icon,
      'slug': instance.slug,
      'status': instance.status,
    };
