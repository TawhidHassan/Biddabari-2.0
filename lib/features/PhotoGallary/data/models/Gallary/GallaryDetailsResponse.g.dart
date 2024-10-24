// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GallaryDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GallaryDetailsResponse _$GallaryDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GallaryDetailsResponse(
      json['gallery'] == null
          ? null
          : Gallary.fromJson(json['gallery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GallaryDetailsResponseToJson(
        GallaryDetailsResponse instance) =>
    <String, dynamic>{
      'gallery': instance.gallery,
    };
