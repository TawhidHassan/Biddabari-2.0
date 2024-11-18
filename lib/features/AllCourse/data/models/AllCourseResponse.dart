// ignore_for_file: file_names
import 'package:biddabari_new/features/AllCourse/data/models/allCourse_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'CourseCategory/CourseCategoryData.dart';




part 'AllCourseResponse.g.dart';

@JsonSerializable()
class AllCourseResponse{

  List<CourseCategoryData>? courseCategories;
  AllCourseModel? courses;


  AllCourseResponse(this.courseCategories, this.courses);

  factory AllCourseResponse.fromJson(Map<String,dynamic>json)=>
      _$AllCourseResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$AllCourseResponseToJson(this);
}