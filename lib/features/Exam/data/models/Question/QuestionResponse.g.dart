// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) =>
    QuestionResponse(
      json['success'],
      json['message'] as String?,
      json['msg'] as String?,
      json['status'] as String?,
      json['error'] as String?,
      json['exam'] == null
          ? null
          : Exam.fromJson(json['exam'] as Map<String, dynamic>),
      json['content'] == null
          ? null
          : Exam.fromJson(json['content'] as Map<String, dynamic>),
      json['myPosition'] == null
          ? null
          : Exam.fromJson(json['myPosition'] as Map<String, dynamic>),
      json['sectionContent'] == null
          ? null
          : CourseSectionContent.fromJson(
              json['sectionContent'] as Map<String, dynamic>),
      json['writtenFile'] as String?,
    );

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'msg': instance.msg,
      'status': instance.status,
      'error': instance.error,
      'exam': instance.exam,
      'content': instance.content,
      'myPosition': instance.myPosition,
      'sectionContent': instance.sectionContent,
      'writtenFile': instance.writtenFile,
    };
