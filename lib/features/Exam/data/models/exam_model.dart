import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Exam.dart';


part 'exam_model.g.dart';

@JsonSerializable()
class ExamModel extends Exam {

  String? name;
  ExamModel(this.name,);





  factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelToJson(this);
}