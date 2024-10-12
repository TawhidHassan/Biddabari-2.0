// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseOrderResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseOrderResponse _$CourseOrderResponseFromJson(Map<String, dynamic> json) =>
    CourseOrderResponse(
      (json['courseOrders'] as List<dynamic>?)
          ?.map((e) => CourseOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseOrderResponseToJson(
        CourseOrderResponse instance) =>
    <String, dynamic>{
      'courseOrders': instance.courseOrders,
    };
