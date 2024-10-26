// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MasterExam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterExam _$MasterExamFromJson(Map<String, dynamic> json) => MasterExam(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['slug'] as String?,
      json['sub_title'] as String?,
      json['price'] as String?,
      json['banner'] as String?,
      json['description'] as String?,
      json['featured_video_url'] as String?,
      (json['package_duration_in_days'] as num?)?.toInt(),
      (json['discount_type'] as num?)?.toInt(),
      json['discount_amount'],
      json['discount_start_date'],
      json['discount_start_date_timestamp'],
      json['discount_end_date'],
      json['discount_end_date_timestamp'],
      (json['is_paid'] as num?)?.toInt(),
      (json['is_featured'] as num?)?.toInt(),
      (json['is_approved'] as num?)?.toInt(),
      (json['status'] as num?)?.toInt(),
      (json['is_master_exam'] as num?)?.toInt(),
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      json['purchase_status'] as String?,
      (json['batch_exam_subscriptions'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MasterExamToJson(MasterExam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'sub_title': instance.subTitle,
      'price': instance.price,
      'banner': instance.banner,
      'description': instance.description,
      'featured_video_url': instance.featuredVideoUrl,
      'package_duration_in_days': instance.packageDurationInDays,
      'discount_type': instance.discountType,
      'discount_amount': instance.discountAmount,
      'discount_start_date': instance.discountStartDate,
      'discount_start_date_timestamp': instance.discountStartDateTimestamp,
      'discount_end_date': instance.discountEndDate,
      'discount_end_date_timestamp': instance.discountEndDateTimestamp,
      'is_paid': instance.isPaid,
      'is_featured': instance.isFeatured,
      'is_approved': instance.isApproved,
      'status': instance.status,
      'is_master_exam': instance.isMasterExam,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'purchase_status': instance.purchaseStatus,
      'batch_exam_subscriptions': instance.batch_exam_subscriptions,
    };
