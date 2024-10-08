// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
import 'CourseCategoryData.dart';



part 'CourseCategoryResponse.g.dart';

@JsonSerializable()
class CourseCategoryResponse{

  CourseCategoryData? courseCategory;


  CourseCategoryResponse(this.courseCategory);

  factory CourseCategoryResponse.fromJson(Map<String,dynamic>json)=>
      _$CourseCategoryResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseCategoryResponseToJson(this);
}