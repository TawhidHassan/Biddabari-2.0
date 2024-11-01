// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';





part 'Coupon.g.dart';

@JsonSerializable()
class Coupon{


  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "course_id")
  int? courseId;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "percentage_value")
  int? percentageValue;
  @JsonKey(name: "discount_amount")
  int? discountAmount;
  @JsonKey(name: "flat_discount")
  dynamic flatDiscount;
  @JsonKey(name: "note")
  dynamic note;
  @JsonKey(name: "expire_date_time")
  String? expireDateTime;
  @JsonKey(name: "expire_date_time_timestamp")
  String? expireDateTimeTimestamp;
  @JsonKey(name: "available_from")
  String? availableFrom;
  @JsonKey(name: "avaliable_from_timestamp")
  String? avaliableFromTimestamp;
  @JsonKey(name: "avaliable_to")
  dynamic avaliableTo;
  @JsonKey(name: "avaliable_to_timestamp")
  String? avaliableToTimestamp;

  Coupon({
    this.id,
    this.courseId,
    this.code,
    this.type,
    this.percentageValue,
    this.discountAmount,
    this.flatDiscount,
    this.note,
    this.expireDateTime,
    this.expireDateTimeTimestamp,
    this.availableFrom,
    this.avaliableFromTimestamp,
    this.avaliableTo,
    this.avaliableToTimestamp,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}