// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';



part 'Option.g.dart';

@JsonSerializable()
class Option{


  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "question_store_id")
  int? questionStoreId;
  @JsonKey(name: "created_by")
  int? createdBy;
  @JsonKey(name: "option_title")
  String? optionTitle;
  @JsonKey(name: "is_correct")
  int? isCorrect;
  @JsonKey(name: "my_ans")
  int? myAns;

  @JsonKey(name: "option_description")
  dynamic optionDescription;
  @JsonKey(name: "option_image")
  dynamic optionImage;
  @JsonKey(name: "option_video_url")
  dynamic optionVideoUrl;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;


  Option(
      this.id,
      this.questionStoreId,
      this.createdBy,
      this.optionTitle,
      this.isCorrect,
      this.myAns,
      this.optionDescription,
      this.optionImage,
      this.optionVideoUrl,
      this.createdAt,
      this.updatedAt);

  factory Option.fromJson(Map<String,dynamic>json)=>
      _$OptionFromJson(json);
  Map<String,dynamic>toJson()=>_$OptionToJson(this);
}