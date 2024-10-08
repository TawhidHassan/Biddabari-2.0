// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'CourseSectionContent.dart';



part 'CourseSectionContentResponse.g.dart';

@JsonSerializable()
class CourseSectionContentResponse{

  List<CourseSectionContent>? courseClassContents;


  CourseSectionContentResponse(this.courseClassContents);

  factory CourseSectionContentResponse.fromJson(Map<String,dynamic>json)=>
      _$CourseSectionContentResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseSectionContentResponseToJson(this);
}