// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slider _$SliderFromJson(Map<String, dynamic> json) => Slider(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['image'] as String?,
      json['link'] as String?,
      json['description'] as String?,
      json['content_type'] as String?,
      (json['parent_model_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SliderToJson(Slider instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'link': instance.link,
      'description': instance.description,
      'content_type': instance.content_type,
      'parent_model_id': instance.parent_model_id,
    };
