import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Teacher.dart';


part 'teacher_model.g.dart';

@JsonSerializable()
class TeacherModel  {

  String? name;
  TeacherModel(this.name,);





  factory TeacherModel.fromJson(Map<String, dynamic> json) => _$TeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);
}