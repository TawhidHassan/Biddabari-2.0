// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CouponResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponResponse _$CouponResponseFromJson(Map<String, dynamic> json) =>
    CouponResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      currentTotal: json['currentTotal'] as int?,
    );

Map<String, dynamic> _$CouponResponseToJson(CouponResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'coupon': instance.coupon,
      'currentTotal': instance.currentTotal,
    };
