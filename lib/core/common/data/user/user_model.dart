import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'user_model.g.dart';

@JsonSerializable()
class UserModel  {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  dynamic name;
  @JsonKey(name: "member_code")
  dynamic? memberCode;
  @JsonKey(name: "email")
  dynamic email;
  @JsonKey(name: "phone")
  String? phone;
  String? dob;
  String? bio;
  String? currency;
  String? cover_image;
  @JsonKey(name: "longitude")
  String? longitude;
  @JsonKey(name: "latitude")
  String? latitude;
  @JsonKey(name: "gender")
  dynamic gender;
  @JsonKey(name: "image")
  dynamic image;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "email_verified_at")
  dynamic emailVerifiedAt;
  @JsonKey(name: "password")
  dynamic password;
  @JsonKey(name: "otp")
  dynamic otp;
  @JsonKey(name: "verified_at")
  DateTime? verifiedAt;
  @JsonKey(name: "remember_token")
  dynamic rememberToken;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;



  UserModel(
      this.id,
      this.name,
      this.memberCode,
      this.email,
      this.phone,
      this.dob,
      this.bio,
      this.currency,
      this.cover_image,
      this.longitude,
      this.latitude,
      this.gender,
      this.image,
      this.country,
      this.emailVerifiedAt,
      this.password,
      this.otp,
      this.verifiedAt,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
