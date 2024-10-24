// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Gallary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gallary _$GallaryFromJson(Map<String, dynamic> json) => Gallary(
      json['id'] as int?,
      json['title'] as String?,
      json['sub_title'] as String?,
      json['banner'] as String?,
      json['gallery_id'] as int?,
      json['image_url'] as String?,
      (json['gallery_images'] as List<dynamic>?)
          ?.map((e) => Gallary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GallaryToJson(Gallary instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'banner': instance.banner,
      'gallery_id': instance.galleryId,
      'image_url': instance.imageUrl,
      'gallery_images': instance.gallery_images,
    };
