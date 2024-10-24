// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../Exam.dart';
import 'MasterExam.dart';

part 'ExamDetailsResponse.g.dart';

@JsonSerializable()
class ExamDetailsResponse{


  Exam? exam;
  String? enrollStatus;


  ExamDetailsResponse(this.exam, this.enrollStatus);

  factory ExamDetailsResponse.fromJson(Map<String,dynamic>json)=>
      _$ExamDetailsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$ExamDetailsResponseToJson(this);
}