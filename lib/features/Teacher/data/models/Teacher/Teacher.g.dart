// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      (json['id'] as num?)?.toInt(),
      (json['current_page'] as num?)?.toInt(),
      json['first_page_url'] as String?,
      json['last_page_url'] as String?,
      (json['total'] as num?)?.toInt(),
      (json['per_page'] as num?)?.toInt(),
      (json['data'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['subject'] as String?,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['image'] as String?,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'current_page': instance.current_page,
      'first_page_url': instance.first_page_url,
      'last_page_url': instance.last_page_url,
      'total': instance.total,
      'per_page': instance.per_page,
      'data': instance.data,
      'subject': instance.subject,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'image': instance.image,
      'user': instance.user,
    };
