import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'country_model.g.dart';

@JsonSerializable()
class CountryModel  {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "shortcut")
  String? shortcut;
  @JsonKey(name: "icon")
  String? icon;
  String? currency;
  String? currency_rate;
  @JsonKey(name: "phone_number_code")
  String? phoneNumberCode;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "created_at")
  dynamic createdAt;
  @JsonKey(name: "updated_at")
  dynamic updatedAt;

  CountryModel({
    this.id,
    this.name,
    this.shortcut,
    this.icon,
    this.currency,
    this.currency_rate,
    this.phoneNumberCode,
    this.status,
    this.createdAt,
    this.updatedAt,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          shortcut == other.shortcut &&
          icon == other.icon &&
          currency == other.currency &&
          currency_rate == other.currency_rate &&
          phoneNumberCode == other.phoneNumberCode &&
          status == other.status &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      shortcut.hashCode ^
      icon.hashCode ^
      currency.hashCode ^
      currency_rate.hashCode ^
      phoneNumberCode.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
