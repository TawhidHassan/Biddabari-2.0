// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionSave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionSave _$QuestionSaveFromJson(Map<String, dynamic> json) => QuestionSave(
      (json['id'] as num?)?.toInt(),
      (json['user_id'] as num?)?.toInt(),
      (json['question_store_id'] as num?)?.toInt(),
      json['created_at'] as String?,
      json['question_store'] == null
          ? null
          : Question.fromJson(json['question_store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionSaveToJson(QuestionSave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'question_store_id': instance.question_store_id,
      'created_at': instance.created_at,
      'question_store': instance.question_store,
    };
