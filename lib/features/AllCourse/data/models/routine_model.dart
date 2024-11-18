import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/AllCourse.dart';


part 'routine_model.g.dart';

@JsonSerializable()
class RoutineModel extends AllCourse {

  int? id;
  int? course_id;
  int? user_id;
  int? parent_model_id;
  String? day;
  String? name;
  String? email;
  String? message;
  String? date_time;
  String? type;
  String? content_name;
  dynamic room;
  dynamic note;
  int? status;
  int? is_seen;
  DateTime? created_at;


  RoutineModel(
      this.id,
      this.course_id,
      this.user_id,
      this.parent_model_id,
      this.day,
      this.name,
      this.email,
      this.message,
      this.date_time,
      this.type,
      this.content_name,
      this.room,
      this.note,
      this.status,
      this.is_seen,
      this.created_at);

  factory RoutineModel.fromJson(Map<String, dynamic> json) => _$RoutineModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineModelToJson(this);
}