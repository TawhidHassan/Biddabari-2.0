// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../courseSectionContent/CourseSectionContent.dart';



part 'CourseSection.g.dart';

@JsonSerializable()
class CourseSection{

  num? id;
  num? course_id;
  String? title;
  String? available_at;
  num? is_paid;
  num? status;
  List<CourseSectionContent>?course_section_contents;


  CourseSection(this.id, this.course_id, this.title, this.available_at,
      this.is_paid, this.status, this.course_section_contents);

  factory CourseSection.fromJson(Map<String,dynamic>json)=>
      _$CourseSectionFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseSectionToJson(this);
}