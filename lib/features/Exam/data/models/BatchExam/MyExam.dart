// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../Exam.dart';
import 'BatchExamSection.dart';
import 'MasterExam.dart';

part 'MyExam.g.dart';

@JsonSerializable()
class MyExam{


  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "parent_model_id")
  int? parentModelId;
  @JsonKey(name: "batch_exam_subscription_id")
  int? batchExamSubscriptionId;
  @JsonKey(name: "ordered_for")
  String? orderedFor;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "has_validity")
  String? hasValidity;
  @JsonKey(name: "order_status")
  String? orderStatus;
  Exam? batch_exam;
  num? is_master_exam;


  List<BatchExamSection>?batch_exam_sections;


  MyExam(
      this.id,
      this.userId,
      this.parentModelId,
      this.batchExamSubscriptionId,
      this.orderedFor,
      this.title,
      this.status,
      this.hasValidity,
      this.orderStatus,
      this.batch_exam,
      this.is_master_exam,
      this.batch_exam_sections);

  factory MyExam.fromJson(Map<String,dynamic>json)=>
      _$MyExamFromJson(json);
  Map<String,dynamic>toJson()=>_$MyExamToJson(this);
}