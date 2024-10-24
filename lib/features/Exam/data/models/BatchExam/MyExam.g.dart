// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyExam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyExam _$MyExamFromJson(Map<String, dynamic> json) => MyExam(
      json['id'] as int?,
      json['user_id'] as int?,
      json['parent_model_id'] as int?,
      json['batch_exam_subscription_id'] as int?,
      json['ordered_for'] as String?,
      json['title'] as String?,
      json['status'],
      json['has_validity'] as String?,
      json['order_status'] as String?,
      json['batch_exam'] == null
          ? null
          : Exam.fromJson(json['batch_exam'] as Map<String, dynamic>),
      json['is_master_exam'] as num?,
      (json['batch_exam_sections'] as List<dynamic>?)
          ?.map((e) => BatchExamSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyExamToJson(MyExam instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'parent_model_id': instance.parentModelId,
      'batch_exam_subscription_id': instance.batchExamSubscriptionId,
      'ordered_for': instance.orderedFor,
      'title': instance.title,
      'status': instance.status,
      'has_validity': instance.hasValidity,
      'order_status': instance.orderStatus,
      'batch_exam': instance.batch_exam,
      'is_master_exam': instance.is_master_exam,
      'batch_exam_sections': instance.batch_exam_sections,
    };
