// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Coupon.dart';

part 'CouponResponse.g.dart';

@JsonSerializable()
class CouponResponse{



  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "coupon")
  Coupon? coupon;
  @JsonKey(name: "currentTotal")
  int? currentTotal;

  CouponResponse({
    this.status,
    this.message,
    this.coupon,
    this.currentTotal,
  });

  factory CouponResponse.fromJson(Map<String, dynamic> json) => _$CouponResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CouponResponseToJson(this);
}