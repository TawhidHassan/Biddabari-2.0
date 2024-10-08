// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TeacherResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherResponse _$TeacherResponseFromJson(Map<String, dynamic> json) =>
    TeacherResponse(
      json['teachers'] == null
          ? null
          : Teacher.fromJson(json['teachers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherResponseToJson(TeacherResponse instance) =>
    <String, dynamic>{
      'teachers': instance.teachers,
    };
