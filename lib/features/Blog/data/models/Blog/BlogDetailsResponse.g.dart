// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogDetailsResponse _$BlogDetailsResponseFromJson(Map<String, dynamic> json) =>
    BlogDetailsResponse(
      (json['recentBlogs'] as List<dynamic>?)
          ?.map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['blog'] == null
          ? null
          : Blog.fromJson(json['blog'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogDetailsResponseToJson(
        BlogDetailsResponse instance) =>
    <String, dynamic>{
      'recentBlogs': instance.recentBlogs,
      'blog': instance.blog,
    };
