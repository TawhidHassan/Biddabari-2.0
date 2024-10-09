// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookResponseToJson(BookResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'products': instance.products,
    };
