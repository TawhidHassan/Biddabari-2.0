// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../../../AllCourse/data/models/course/Course.dart';
import 'Exam.dart';

part 'FreeClassExamResponse.g.dart';

@JsonSerializable()
class FreeClassExamResponse{


  List<Course>?courses;
  List<Exam>?batchExams;

  FreeClassExamResponse(this.courses, this.batchExams);

  factory FreeClassExamResponse.fromJson(Map<String,dynamic>json)=>
      _$FreeClassExamResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$FreeClassExamResponseToJson(this);
}