// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'UserRresponse.g.dart';

@JsonSerializable()
class UserRresponse{

  bool? success;
  User?student;
  User?user;


  UserRresponse(this.success, this.student, this.user);

  factory UserRresponse.fromJson(Map<String,dynamic>json)=>
      _$UserRresponseFromJson(json);
  Map<String,dynamic>toJson()=>_$UserRresponseToJson(this);
}