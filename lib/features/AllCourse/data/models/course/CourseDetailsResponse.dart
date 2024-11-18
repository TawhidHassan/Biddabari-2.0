// ignore_for_file: file_names
import 'package:biddabari_new/features/AllCourse/data/models/routine_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Course.dart';



part 'CourseDetailsResponse.g.dart';

@JsonSerializable()
class CourseDetailsResponse{
  Course?course;
  Course? courseSec;
  List<RoutineModel>? reviews;
  num? totalStudentEnrollments;
  String? courseEnrollStatus;


  CourseDetailsResponse(this.course, this.courseSec, this.reviews,
      this.totalStudentEnrollments, this.courseEnrollStatus);

  factory CourseDetailsResponse.fromJson(Map<String,dynamic>json)=>
      _$CourseDetailsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseDetailsResponseToJson(this);
}