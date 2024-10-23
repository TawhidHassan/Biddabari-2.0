// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) => BlogResponse(
      (json['blogCategories'] as List<dynamic>?)
          ?.map((e) => Categorie.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['blogs'] == null
          ? null
          : BlogData.fromJson(json['blogs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogResponseToJson(BlogResponse instance) =>
    <String, dynamic>{
      'blogCategories': instance.blogCategories,
      'blogs': instance.blogs,
    };
