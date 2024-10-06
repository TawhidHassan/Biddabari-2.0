// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sucess_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SucessModel _$SucessModelFromJson(Map<String, dynamic> json) => SucessModel(
      json['status'] as String?,
      json['message'] as String?,
      json['photo'] as String?,
      json['time'] as String?,
      json['taskCompleted'] as num?,
      json['taskOngoing'] as num?,
      json['taskRejection'] as num?,
    );

Map<String, dynamic> _$SucessModelToJson(SucessModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'photo': instance.photo,
      'time': instance.time,
      'taskCompleted': instance.taskCompleted,
      'taskOngoing': instance.taskOngoing,
      'taskRejection': instance.taskRejection,
    };
