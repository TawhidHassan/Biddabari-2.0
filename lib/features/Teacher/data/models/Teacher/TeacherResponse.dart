// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Teacher.dart';

part 'TeacherResponse.g.dart';

@JsonSerializable()
class TeacherResponse{

 Teacher? teachers;


 TeacherResponse(this.teachers);

  factory TeacherResponse.fromJson(Map<String,dynamic>json)=>
      _$TeacherResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$TeacherResponseToJson(this);
}