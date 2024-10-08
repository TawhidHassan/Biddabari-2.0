// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['courseCategories'] as List<dynamic>?)
          ?.map((e) => Categorie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'courseCategories': instance.courseCategories,
    };
