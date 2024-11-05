// ignore_for_file: file_names
import 'package:biddabari_new/features/Exam/data/models/Exam.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/Category/subCategory/SubCategory.dart';
import '../course/Course.dart';




part 'CourseCategoryData.g.dart';

@JsonSerializable()
class CourseCategoryData{

  num? id;
  num? category_id;
  num? section_content_id;
  num? exam_id;
  String? type;
  String? name;
  String? parentId;
  String? image;
  String? second_image;
  String? thumbnail;
  String? icon;
  String? slug;
  String? status;
  Course? category_video;
  Exam? category_exam;
  List<Course>? courses;
  List<SubCategory>? course_categories;


  CourseCategoryData(
      this.id,
      this.category_id,
      this.section_content_id,
      this.exam_id,
      this.type,
      this.name,
      this.parentId,
      this.image,
      this.second_image,
      this.thumbnail,
      this.icon,
      this.slug,
      this.status,
      this.category_video,
      this.category_exam,
      this.courses,
      this.course_categories);

  factory CourseCategoryData.fromJson(Map<String,dynamic>json)=>
      _$CourseCategoryDataFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseCategoryDataToJson(this);
}