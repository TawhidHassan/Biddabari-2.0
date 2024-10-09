// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyBook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBook _$MyBookFromJson(Map<String, dynamic> json) => MyBook(
      json['id'] as int?,
      json['slug'] as int?,
      json['user_id'] as int?,
      json['parent_model_id'] as int?,
      json['batch_exam_subscription_id'],
      json['ordered_for'] as String?,
      json['status'] as String?,
      json['image'] as String?,
      json['product'] == null
          ? null
          : Book.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyBookToJson(MyBook instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'user_id': instance.userId,
      'parent_model_id': instance.parentModelId,
      'batch_exam_subscription_id': instance.batchExamSubscriptionId,
      'ordered_for': instance.orderedFor,
      'status': instance.status,
      'image': instance.image,
      'product': instance.product,
    };
