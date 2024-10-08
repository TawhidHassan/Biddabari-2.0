

// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/user/User.dart';
import 'DataBean.dart';
import 'ErrorModel.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse{


  dynamic success;
  num? statusCode;

  String? version;
  String? message;
  dynamic? error;
  String? token;
  String? name;
  String? email;
  String? mobileNumber;
  String? profilePicture;
  String? chefId;
  String? type;
  num? rating;
  User? user;
  String? auth_token;


  LoginResponse(
      this.success,
      this.statusCode,
      this.version,
      this.message,
      this.error,
      this.token,
      this.name,
      this.email,
      this.mobileNumber,
      this.profilePicture,
      this.chefId,
      this.type,
      this.rating,
      this.user,
      this.auth_token);

  factory LoginResponse.fromJson(Map<String,dynamic>json)=>
      _$LoginResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$LoginResponseToJson(this);
}

