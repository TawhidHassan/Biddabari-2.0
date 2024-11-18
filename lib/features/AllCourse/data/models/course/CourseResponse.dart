// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Course.dart';



part 'CourseResponse.g.dart';

@JsonSerializable()
class CourseResponse{



  bool? success;
  String? message;
  List<Course>?courses;
  List<Course>?popular_courses;


  CourseResponse(this.success, this.message, this.courses,this.popular_courses);

  factory CourseResponse.fromJson(Map<String,dynamic>json)=>
      _$CourseResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseResponseToJson(this);
}