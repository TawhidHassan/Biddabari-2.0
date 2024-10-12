// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Option.dart';



part 'Question.g.dart';

@JsonSerializable()
class Question{


  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "question_type")
  String? questionType;


  @JsonKey(name: "question")
  String? question;
  String? mcq_ans_description;
  @JsonKey(name: "question_image")
  dynamic questionImage;
  @JsonKey(name: "question_video_link")
  dynamic questionVideoLink;
  @JsonKey(name: "has_all_wrong_ans")
  dynamic hasAllWrongAns;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "subject_name")
  dynamic subjectName;

  String? answer;
  bool? isfixed;

  List<Option>?question_options;


  Question(
      {this.id,
      this.questionType,
      this.question,
      this.mcq_ans_description,
      this.questionImage,
      this.questionVideoLink,
      this.hasAllWrongAns,
      this.status,
      this.subjectName,
      this.answer,
      this.isfixed = false,
      this.question_options});

  factory Question.fromJson(Map<String,dynamic>json)=>
      _$QuestionFromJson(json);
  Map<String,dynamic>toJson()=>_$QuestionToJson(this);
}