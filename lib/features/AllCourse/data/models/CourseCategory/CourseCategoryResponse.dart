// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
import 'CourseCategoryData.dart';



part 'CourseCategoryResponse.g.dart';

@JsonSerializable()
class CourseCategoryResponse{

  CourseCategoryData? courseCategory;
  List<CourseCategoryData>? courseCategories;
  List<CourseCategoryData>? free_class_videos;
  List<CourseCategoryData>? free_exams;


  CourseCategoryResponse(this.courseCategory,this.courseCategories);

  factory CourseCategoryResponse.fromJson(Map<String,dynamic>json)=>
      _$CourseCategoryResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseCategoryResponseToJson(this);
}