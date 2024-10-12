// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExamResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['courseExamResults'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'courseExamResults': instance.courseExamResults,
    };
