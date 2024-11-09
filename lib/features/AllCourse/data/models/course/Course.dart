// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../Teacher/data/models/Teacher/Teacher.dart';
import '../courseSection/CourseSection.dart';





part 'Course.g.dart';

@JsonSerializable()
class Course{

  num? id;
  num? price;
  String? title;
  String? sub_title;
  String? banner;
  String? image;
  String? description;
  String? starting_date_time;
  String? ending_date_time;
  num? discount_type;
  num? discount_amount;
  num? total_video;
  dynamic? total_class;
  num? total_note;
  num? total_exam;
  num? is_paid;
  num? status;
  String? discount_start_date;
  String? discount_end_date;
  String? admission_last_date;
  String? order_status;
  String? video_link;
  List<Teacher>?teachers;
  List<CourseSection>?course_sections;


  Course(
      {this.id,
      this.price,
      this.title,
      this.sub_title,
      this.banner,
      this.image,
      this.description,
      this.starting_date_time,
      this.ending_date_time,
      this.discount_type,
      this.discount_amount,
      this.total_video,
      this.total_class,
      this.total_note,
      this.total_exam,
      this.is_paid,
      this.status,
      this.discount_start_date,
      this.discount_end_date,
      this.admission_last_date,
      this.order_status,
      this.video_link,
      this.teachers,
      this.course_sections});

  factory Course.fromJson(Map<String,dynamic>json)=>
      _$CourseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseToJson(this);
}