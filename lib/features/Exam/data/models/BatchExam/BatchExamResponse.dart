// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../Exam.dart';
import 'ExamCategorie.dart';
import 'MasterExam.dart';

part 'BatchExamResponse.g.dart';

@JsonSerializable()
class BatchExamResponse{




  List<ExamCategorie>?examCategories;
  MasterExam? masterExam;
  List<Exam>?allExams;


  BatchExamResponse(this.examCategories, this.masterExam,this.allExams);

  factory BatchExamResponse.fromJson(Map<String,dynamic>json)=>
      _$BatchExamResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$BatchExamResponseToJson(this);
}