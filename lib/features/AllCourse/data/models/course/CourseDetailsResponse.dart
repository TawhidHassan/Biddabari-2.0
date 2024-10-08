// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Course.dart';



part 'CourseDetailsResponse.g.dart';

@JsonSerializable()
class CourseDetailsResponse{
  Course?course;
  String? courseEnrollStatus;


  CourseDetailsResponse(this.course, this.courseEnrollStatus);

  factory CourseDetailsResponse.fromJson(Map<String,dynamic>json)=>
      _$CourseDetailsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseDetailsResponseToJson(this);
}