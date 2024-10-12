// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../Exam.dart';

part 'QuestionResponse.g.dart';

@JsonSerializable()
class QuestionResponse{


  dynamic success;
  String? message;
  String? msg;
  String? status;
  String? error;
  Exam?exam;
  Exam?content;
  Exam?myPosition;
  CourseSectionContent?sectionContent;
  String?writtenFile;


  QuestionResponse(
      this.success,
      this.message,
      this.msg,
      this.status,
      this.error,
      this.exam,
      this.content,
      this.myPosition,
      this.sectionContent,
      this.writtenFile);

  factory QuestionResponse.fromJson(Map<String,dynamic>json)=>
      _$QuestionResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$QuestionResponseToJson(this);
}