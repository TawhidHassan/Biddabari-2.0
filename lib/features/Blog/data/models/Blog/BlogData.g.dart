// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogData _$BlogDataFromJson(Map<String, dynamic> json) => BlogData(
      (json['current_page'] as num?)?.toInt(),
      (json['data'] as List<dynamic>?)
          ?.map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String?,
      json['last_page_url'] as String?,
    );

Map<String, dynamic> _$BlogDataToJson(BlogData instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'last_page_url': instance.last_page_url,
    };
