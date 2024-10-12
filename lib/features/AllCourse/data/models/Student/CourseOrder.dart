// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../course/Course.dart';




part 'CourseOrder.g.dart';

@JsonSerializable()
class CourseOrder{

  num? id;

  num? parent_model_id;
  num? user_id;
  String? status;
  Course? course;


  CourseOrder(
      this.id, this.parent_model_id, this.user_id, this.status, this.course);

  factory CourseOrder.fromJson(Map<String,dynamic>json)=>
      _$CourseOrderFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseOrderToJson(this);
}