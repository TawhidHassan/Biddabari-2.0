// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Question.dart';

part 'QuestionSave.g.dart';

@JsonSerializable()
class QuestionSave{



  int? id;
  int? user_id;
  int? question_store_id;
  String?created_at;
  Question?question_store;


  QuestionSave(this.id, this.user_id, this.question_store_id, this.created_at,
      this.question_store);

  factory QuestionSave.fromJson(Map<String,dynamic>json)=>
      _$QuestionSaveFromJson(json);
  Map<String,dynamic>toJson()=>_$QuestionSaveToJson(this);
}