// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SingleBookResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleBookResponse _$SingleBookResponseFromJson(Map<String, dynamic> json) =>
    SingleBookResponse(
      json['success'] as bool?,
      json['message'] as String?,
      json['product'] == null
          ? null
          : Book.fromJson(json['product'] as Map<String, dynamic>),
      (json['latestProducts'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SingleBookResponseToJson(SingleBookResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'product': instance.product,
      'latestProducts': instance.latestProducts,
    };
