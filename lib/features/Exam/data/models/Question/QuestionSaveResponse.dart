// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'QuestionSave.dart';

part 'QuestionSaveResponse.g.dart';

@JsonSerializable()
class QuestionSaveResponse{



  List<QuestionSave>?questions;


  QuestionSaveResponse(this.questions);

  factory QuestionSaveResponse.fromJson(Map<String,dynamic>json)=>
      _$QuestionSaveResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$QuestionSaveResponseToJson(this);
}