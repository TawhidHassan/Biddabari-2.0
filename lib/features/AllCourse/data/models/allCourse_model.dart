import 'package:biddabari_new/core/common/data/Slider/Slider.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/AllCourse.dart';


part 'allCourse_model.g.dart';

@JsonSerializable()
class AllCourseModel extends AllCourse {

  List<Course>? data;

  int? current_page;
  int? last_page;


  AllCourseModel(
      this.data, this.current_page, this.last_page);

  factory AllCourseModel.fromJson(Map<String, dynamic> json) => _$AllCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCourseModelToJson(this);
}