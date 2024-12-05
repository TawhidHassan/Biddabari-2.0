// ignore_for_file: file_names
import 'package:biddabari_new/features/AllCourse/data/models/allCourse_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/common/data/Slider/Slider.dart';
import 'CourseCategory/CourseCategoryData.dart';




part 'AllCourseResponse.g.dart';

@JsonSerializable()
class AllCourseResponse{

  List<CourseCategoryData>? courseCategories;
  AllCourseModel? courses;
  List<Slider>? course_sliders;


  AllCourseResponse(this.courseCategories, this.courses, this.course_sliders);

  factory AllCourseResponse.fromJson(Map<String,dynamic>json)=>
      _$AllCourseResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$AllCourseResponseToJson(this);
}