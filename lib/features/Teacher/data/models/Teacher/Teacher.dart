// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/user/User.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher{

  int? id;
  int? current_page;
  String? first_page_url;
  String? last_page_url;
  int? total;
  int? per_page;
  List<User>? data;

  String?subject;
  String?first_name;
  String?last_name;
  String?image;
  User? user;


  Teacher(
      this.id,
      this.current_page,
      this.first_page_url,
      this.last_page_url,
      this.total,
      this.per_page,
      this.data,
      this.subject,
      this.first_name,
      this.last_name,
      this.image,
      this.user);

  factory Teacher.fromJson(Map<String,dynamic>json)=>
      _$TeacherFromJson(json);
  Map<String,dynamic>toJson()=>_$TeacherToJson(this);
}