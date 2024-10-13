// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      (json['id'] as num?)?.toInt(),
      (json['question_store_id'] as num?)?.toInt(),
      (json['created_by'] as num?)?.toInt(),
      json['option_title'] as String?,
      (json['is_correct'] as num?)?.toInt(),
      (json['my_ans'] as num?)?.toInt(),
      json['option_description'],
      json['option_image'],
      json['option_video_url'],
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'question_store_id': instance.questionStoreId,
      'created_by': instance.createdBy,
      'option_title': instance.optionTitle,
      'is_correct': instance.isCorrect,
      'my_ans': instance.myAns,
      'option_description': instance.optionDescription,
      'option_image': instance.optionImage,
      'option_video_url': instance.optionVideoUrl,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
