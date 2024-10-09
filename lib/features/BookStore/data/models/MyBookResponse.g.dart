// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyBookResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBookResponse _$MyBookResponseFromJson(Map<String, dynamic> json) =>
    MyBookResponse(
      (json['products'] as List<dynamic>?)
          ?.map((e) => MyBook.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliveryCharge'] as num?,
    );

Map<String, dynamic> _$MyBookResponseToJson(MyBookResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
      'deliveryCharge': instance.deliveryCharge,
    };
