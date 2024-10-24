// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExamDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDetailsResponse _$ExamDetailsResponseFromJson(Map<String, dynamic> json) =>
    ExamDetailsResponse(
      json['exam'] == null
          ? null
          : Exam.fromJson(json['exam'] as Map<String, dynamic>),
      json['enrollStatus'] as String?,
    );

Map<String, dynamic> _$ExamDetailsResponseToJson(
        ExamDetailsResponse instance) =>
    <String, dynamic>{
      'exam': instance.exam,
      'enrollStatus': instance.enrollStatus,
    };
