// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/Slider/Slider.dart';
import '../Exam.dart';
import 'ExamCategorie.dart';
import 'MasterExam.dart';

part 'BatchExamResponse.g.dart';

@JsonSerializable()
class BatchExamResponse{




  List<ExamCategorie>?examCategories;
  MasterExam? masterExam;
  List<Exam>?allExams;
  List<Slider>? exam_sliders;


  BatchExamResponse(
      this.examCategories, this.masterExam, this.allExams, this.exam_sliders);

  factory BatchExamResponse.fromJson(Map<String,dynamic>json)=>
      _$BatchExamResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$BatchExamResponseToJson(this);
}