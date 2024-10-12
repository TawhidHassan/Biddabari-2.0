// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import 'Exam.dart';

part 'TodayExamResponse.g.dart';

@JsonSerializable()
class TodayExamResponse{



  List<CourseSectionContent>?courseExams;
  List<Exam>?batchExams;


  TodayExamResponse(this.courseExams, this.batchExams);

  factory TodayExamResponse.fromJson(Map<String,dynamic>json)=>
      _$TodayExamResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$TodayExamResponseToJson(this);
}