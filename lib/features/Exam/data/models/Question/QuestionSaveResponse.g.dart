// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionSaveResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionSaveResponse _$QuestionSaveResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionSaveResponse(
      (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionSave.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionSaveResponseToJson(
        QuestionSaveResponse instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };
