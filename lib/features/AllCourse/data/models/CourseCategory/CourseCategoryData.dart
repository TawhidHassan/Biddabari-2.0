// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/Category/subCategory/SubCategory.dart';
import '../course/Course.dart';




part 'CourseCategoryData.g.dart';

@JsonSerializable()
class CourseCategoryData{

  num? id;
  String? name;
  String? parentId;
  String? image;
  String? icon;
  String? slug;
  String? status;
  List<Course>? courses;
  List<SubCategory>? course_categories;


  CourseCategoryData(
      {this.id,
      this.name,
      this.parentId,
      this.image,
      this.icon,
      this.slug,
      this.status,
      this.courses,
      this.course_categories});

  factory CourseCategoryData.fromJson(Map<String,dynamic>json)=>
      _$CourseCategoryDataFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseCategoryDataToJson(this);
}