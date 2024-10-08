// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
import 'CourseCategory/CourseCategoryData.dart';




part 'AllCourseResponse.g.dart';

@JsonSerializable()
class AllCourseResponse{

  List<CourseCategoryData>? courseCategories;


  AllCourseResponse(this.courseCategories);

  factory AllCourseResponse.fromJson(Map<String,dynamic>json)=>
      _$AllCourseResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$AllCourseResponseToJson(this);
}