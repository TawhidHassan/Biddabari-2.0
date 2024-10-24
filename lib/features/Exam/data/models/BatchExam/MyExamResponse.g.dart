// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyExamResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyExamResponse _$MyExamResponseFromJson(Map<String, dynamic> json) =>
    MyExamResponse(
      (json['exams'] as List<dynamic>?)
          ?.map((e) => MyExam.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['batchExam'] == null
          ? null
          : MyExam.fromJson(json['batchExam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyExamResponseToJson(MyExamResponse instance) =>
    <String, dynamic>{
      'exams': instance.exams,
      'batchExam': instance.batchExam,
    };
