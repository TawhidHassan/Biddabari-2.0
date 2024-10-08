// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'Slider.g.dart';

@JsonSerializable()
class Slider{


  int? id;
  String? title;
  String? image;
  String? link;
  String? description;
  String? content_type;
  String? parent_model_id;


  Slider(this.id, this.title, this.image, this.link, this.description,this.content_type,this.parent_model_id);

  factory Slider.fromJson(Map<String,dynamic>json)=>
      _$SliderFromJson(json);
  Map<String,dynamic>toJson()=>_$SliderToJson(this);
}