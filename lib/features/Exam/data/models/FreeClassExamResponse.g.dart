// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FreeClassExamResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeClassExamResponse _$FreeClassExamResponseFromJson(
        Map<String, dynamic> json) =>
    FreeClassExamResponse(
      (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['batchExams'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreeClassExamResponseToJson(
        FreeClassExamResponse instance) =>
    <String, dynamic>{
      'courses': instance.courses,
      'batchExams': instance.batchExams,
    };
