import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/AllCourse.dart';


part 'allCourse_model.g.dart';

@JsonSerializable()
class AllCourseModel extends AllCourse {

  String? name;
  AllCourseModel(this.name,);





  factory AllCourseModel.fromJson(Map<String, dynamic> json) => _$AllCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCourseModelToJson(this);
}