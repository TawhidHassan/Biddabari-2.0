// ignore_for_file: file_names


import 'package:json_annotation/json_annotation.dart';

import 'Book.dart';



part 'MyBook.g.dart';

@JsonSerializable()
class MyBook{

  @JsonKey(name: "id")
  int? id;
  int? slug;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "parent_model_id")
  int? parentModelId;
  @JsonKey(name: "batch_exam_subscription_id")
  dynamic batchExamSubscriptionId;
  @JsonKey(name: "ordered_for")
  String? orderedFor;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "image")
  String? image;
 Book? product;


  MyBook(
      this.id,
      this.slug,
      this.userId,
      this.parentModelId,
      this.batchExamSubscriptionId,
      this.orderedFor,
      this.status,
      this.image,
      this.product);

  factory MyBook.fromJson(Map<String,dynamic>json)=>
      _$MyBookFromJson(json);
  Map<String,dynamic>toJson()=>_$MyBookToJson(this);
}