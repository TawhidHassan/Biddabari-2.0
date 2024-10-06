// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashModel _$SplashModelFromJson(Map<String, dynamic> json) => SplashModel(
      json['name'] as String?,
      json['title'] as String?,
      (json['color'] as num?)?.toInt(),
      json['imagePath'] as String?,
    );

Map<String, dynamic> _$SplashModelToJson(SplashModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'color': instance.color,
      'imagePath': instance.imagePath,
    };
