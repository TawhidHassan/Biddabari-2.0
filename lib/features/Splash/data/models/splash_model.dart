import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Splash.dart';


part 'splash_model.g.dart';

@JsonSerializable()
class SplashModel {

  String? name;
  String? title;
  int? color;
  String? imagePath;


  SplashModel(this.name, this.title, this.color, this.imagePath);

  factory SplashModel.fromJson(Map<String, dynamic> json) => _$SplashModelFromJson(json);

  Map<String, dynamic> toJson() => _$SplashModelToJson(this);
}