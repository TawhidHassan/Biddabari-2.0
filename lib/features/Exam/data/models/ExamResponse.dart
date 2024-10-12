// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Exam.dart';

part 'ExamResponse.g.dart';

@JsonSerializable()
class ExamResponse{



  bool? success;
  String? message;
  List<Exam>?courseExamResults;


  ExamResponse(this.success, this.message, this.courseExamResults);

  factory ExamResponse.fromJson(Map<String,dynamic>json)=>
      _$ExamResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$ExamResponseToJson(this);
}