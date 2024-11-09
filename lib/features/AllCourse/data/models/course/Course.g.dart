// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as num?,
      price: json['price'] as num?,
      title: json['title'] as String?,
      sub_title: json['sub_title'] as String?,
      banner: json['banner'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      starting_date_time: json['starting_date_time'] as String?,
      ending_date_time: json['ending_date_time'] as String?,
      discount_type: json['discount_type'] as num?,
      discount_amount: json['discount_amount'] as num?,
      total_video: json['total_video'] as num?,
      total_class: json['total_class'],
      total_note: json['total_note'] as num?,
      total_exam: json['total_exam'] as num?,
      is_paid: json['is_paid'] as num?,
      status: json['status'] as num?,
      discount_start_date: json['discount_start_date'] as String?,
      discount_end_date: json['discount_end_date'] as String?,
      admission_last_date: json['admission_last_date'] as String?,
      order_status: json['order_status'] as String?,
      video_link: json['video_link'] as String?,
      teachers: (json['teachers'] as List<dynamic>?)
          ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      course_sections: (json['course_sections'] as List<dynamic>?)
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
      'video_link': instance.video_link,
      'teachers': instance.teachers,
      'course_sections': instance.course_sections,
    };
