// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodayExamResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayExamResponse _$TodayExamResponseFromJson(Map<String, dynamic> json) =>
    TodayExamResponse(
      (json['courseExams'] as List<dynamic>?)
          ?.map((e) => CourseSectionContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['batchExams'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodayExamResponseToJson(TodayExamResponse instance) =>
    <String, dynamic>{
      'courseExams': instance.courseExams,
      'batchExams': instance.batchExams,
    };
