// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../Exam.dart';



part 'ExamCategorie.g.dart';

@JsonSerializable()
class ExamCategorie{

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "parent_id")
  int? parentId;
  @JsonKey(name: "note")
  String? note;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  List<Exam>?batch_exams;


  ExamCategorie(
      {this.id,
      this.name,
      this.parentId,
      this.note,
      this.image,
      this.slug,
      this.order,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.batch_exams});

  factory ExamCategorie.fromJson(Map<String,dynamic>json)=>
      _$ExamCategorieFromJson(json);
  Map<String,dynamic>toJson()=>_$ExamCategorieToJson(this);
}