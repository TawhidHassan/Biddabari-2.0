// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      (json['id'] as num?)?.toInt(),
      json['name'],
      json['member_code'],
      json['email'],
      json['phone'] as String?,
      json['dob'] as String?,
      json['bio'] as String?,
      json['currency'] as String?,
      json['cover_image'] as String?,
      json['longitude'] as String?,
      json['latitude'] as String?,
      json['gender'],
      json['image'],
      json['country'] as String?,
      json['email_verified_at'],
      json['password'],
      json['otp'],
      json['verified_at'] == null
          ? null
          : DateTime.parse(json['verified_at'] as String),
      json['remember_token'],
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'member_code': instance.memberCode,
      'email': instance.email,
      'phone': instance.phone,
      'dob': instance.dob,
      'bio': instance.bio,
      'currency': instance.currency,
      'cover_image': instance.cover_image,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'gender': instance.gender,
      'image': instance.image,
      'country': instance.country,
      'email_verified_at': instance.emailVerifiedAt,
      'password': instance.password,
      'otp': instance.otp,
      'verified_at': instance.verifiedAt?.toIso8601String(),
      'remember_token': instance.rememberToken,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
