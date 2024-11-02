// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      type: json['type'] as String?,
      percentageValue: (json['percentage_value'] as num?)?.toInt(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      flatDiscount: json['flat_discount'],
      note: json['note'],
      expireDateTime: json['expire_date_time'] as String?,
      expireDateTimeTimestamp: json['expire_date_time_timestamp'] as String?,
      availableFrom: json['available_from'] as String?,
      avaliableFromTimestamp: json['avaliable_from_timestamp'] as String?,
      avaliableTo: json['avaliable_to'],
      avaliableToTimestamp: json['avaliable_to_timestamp'] as String?,
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'code': instance.code,
      'type': instance.type,
      'percentage_value': instance.percentageValue,
      'discount_amount': instance.discountAmount,
      'flat_discount': instance.flatDiscount,
      'note': instance.note,
      'expire_date_time': instance.expireDateTime,
      'expire_date_time_timestamp': instance.expireDateTimeTimestamp,
      'available_from': instance.availableFrom,
      'avaliable_from_timestamp': instance.avaliableFromTimestamp,
      'avaliable_to': instance.avaliableTo,
      'avaliable_to_timestamp': instance.avaliableToTimestamp,
    };
