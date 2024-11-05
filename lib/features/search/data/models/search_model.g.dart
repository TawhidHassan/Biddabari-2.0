// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['batchExams'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'courses': instance.courses,
      'batchExams': instance.batchExams,
      'products': instance.products,
    };
