// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allCourse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCourseModel _$AllCourseModelFromJson(Map<String, dynamic> json) =>
    AllCourseModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['current_page'] as num?)?.toInt(),
      (json['last_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AllCourseModelToJson(AllCourseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'current_page': instance.current_page,
      'last_page': instance.last_page,
    };
