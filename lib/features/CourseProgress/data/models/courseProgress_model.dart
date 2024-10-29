import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/CourseProgress.dart';


part 'courseProgress_model.g.dart';

@JsonSerializable()
class CourseProgressModel extends CourseProgress {

  String? name;
  CourseProgressModel(this.name,);





  factory CourseProgressModel.fromJson(Map<String, dynamic> json) => _$CourseProgressModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseProgressModelToJson(this);
}