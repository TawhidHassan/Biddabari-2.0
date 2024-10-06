// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      shortcut: json['shortcut'] as String?,
      icon: json['icon'] as String?,
      currency: json['currency'] as String?,
      currency_rate: json['currency_rate'] as String?,
      phoneNumberCode: json['phone_number_code'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortcut': instance.shortcut,
      'icon': instance.icon,
      'currency': instance.currency,
      'currency_rate': instance.currency_rate,
      'phone_number_code': instance.phoneNumberCode,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
