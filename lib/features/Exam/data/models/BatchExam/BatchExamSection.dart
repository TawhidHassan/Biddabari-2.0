// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import 'BatchExamSectionContent.dart';



part 'BatchExamSection.g.dart';

@JsonSerializable()
class BatchExamSection{

  num? id;
  num? course_id;
  String? title;
  String? available_at;
  num? is_paid;
  num? status;
  List<CourseSectionContent>?batch_exam_section_contents;


  BatchExamSection(this.id, this.course_id, this.title, this.available_at,
      this.is_paid, this.status, this.batch_exam_section_contents);

  factory BatchExamSection.fromJson(Map<String,dynamic>json)=>
      _$BatchExamSectionFromJson(json);
  Map<String,dynamic>toJson()=>_$BatchExamSectionToJson(this);
}