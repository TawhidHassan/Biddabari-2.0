import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'sucess_model.g.dart';

@JsonSerializable()
class SucessModel  {

  String? status;
  String? message;
  String? photo;
  String? time;
  num? taskCompleted;
  num? taskOngoing;
  num? taskRejection;



  SucessModel(this.status, this.message, this.photo, this.time,
      this.taskCompleted, this.taskOngoing, this.taskRejection);

  factory SucessModel.fromJson(Map<String, dynamic> json) => _$SucessModelFromJson(json);
  Map<String, dynamic> toJson() => _$SucessModelToJson(this);
}
