// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BatchExamResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchExamResponse _$BatchExamResponseFromJson(Map<String, dynamic> json) =>
    BatchExamResponse(
      (json['examCategories'] as List<dynamic>?)
          ?.map((e) => ExamCategorie.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['masterExam'] == null
          ? null
          : MasterExam.fromJson(json['masterExam'] as Map<String, dynamic>),
      (json['allExams'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchExamResponseToJson(BatchExamResponse instance) =>
    <String, dynamic>{
      'examCategories': instance.examCategories,
      'masterExam': instance.masterExam,
      'allExams': instance.allExams,
    };
