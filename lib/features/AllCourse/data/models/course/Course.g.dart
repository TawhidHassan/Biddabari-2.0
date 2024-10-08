// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      json['id'] as num?,
      json['price'] as num?,
      json['title'] as String?,
      json['sub_title'] as String?,
      json['banner'] as String?,
      json['image'] as String?,
      json['description'] as String?,
      json['starting_date_time'] as String?,
      json['ending_date_time'] as String?,
      json['discount_type'] as num?,
      json['discount_amount'] as num?,
      json['total_video'] as num?,
      json['total_class'],
      json['total_note'] as num?,
      json['total_exam'] as num?,
      json['is_paid'] as num?,
      json['status'] as num?,
      json['discount_start_date'] as String?,
      json['discount_end_date'] as String?,
      json['admission_last_date'] as String?,
      json['order_status'] as String?,
      (json['teachers'] as List<dynamic>?)
          ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['course_sections'] as List<dynamic>?)
          ?.map((e) => CourseSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'title': instance.title,
      'sub_title': instance.sub_title,
      'banner': instance.banner,
      'image': instance.image,
      'description': instance.description,
      'starting_date_time': instance.starting_date_time,
      'ending_date_time': instance.ending_date_time,
      'discount_type': instance.discount_type,
      'discount_amount': instance.discount_amount,
      'total_video': instance.total_video,
      'total_class': instance.total_class,
      'total_note': instance.total_note,
      'total_exam': instance.total_exam,
      'is_paid': instance.is_paid,
      'status': instance.status,
      'discount_start_date': instance.discount_start_date,
      'discount_end_date': instance.discount_end_date,
      'admission_last_date': instance.admission_last_date,
      'order_status': instance.order_status,
      'teachers': instance.teachers,
      'course_sections': instance.course_sections,
    };
