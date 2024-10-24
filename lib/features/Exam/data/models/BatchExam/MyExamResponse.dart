// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'MasterExam.dart';
import 'MyExam.dart';

part 'MyExamResponse.g.dart';

@JsonSerializable()
class MyExamResponse{

  List<MyExam>?exams;
  MyExam?batchExam;


  MyExamResponse(this.exams, this.batchExam);

  factory MyExamResponse.fromJson(Map<String,dynamic>json)=>
      _$MyExamResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$MyExamResponseToJson(this);
}