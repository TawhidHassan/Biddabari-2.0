// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GallaryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GallaryResponse _$GallaryResponseFromJson(Map<String, dynamic> json) =>
    GallaryResponse(
      (json['galleries'] as List<dynamic>?)
          ?.map((e) => Gallary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GallaryResponseToJson(GallaryResponse instance) =>
    <String, dynamic>{
      'galleries': instance.galleries,
    };
