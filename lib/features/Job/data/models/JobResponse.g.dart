// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JobResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResponse _$JobResponseFromJson(Map<String, dynamic> json) => JobResponse(
      (json['circularCategories'] as List<dynamic>?)
          ?.map((e) => Categorie.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['circulars'] as List<dynamic>?)
          ?.map((e) => Categorie.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['recentPosts'] as List<dynamic>?)
          ?.map((e) => JobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['circular'] == null
          ? null
          : JobModel.fromJson(json['circular'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobResponseToJson(JobResponse instance) =>
    <String, dynamic>{
      'circularCategories': instance.circularCategories,
      'circulars': instance.circulars,
      'recentPosts': instance.recentPosts,
      'circular': instance.circular,
    };
