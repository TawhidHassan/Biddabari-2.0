

// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'DataBean.dart';
import 'ErrorModel.dart';

part 'ForgetPasswordResponse.g.dart';

@JsonSerializable()
class ForgetPasswordResponse{


  String? success;
  String? message;
  String? encoded_otp;
  String? mobile;
  num? otp;
  String? error;
  ErrorModel? errors;


  ForgetPasswordResponse(this.success, this.message, this.encoded_otp,
      this.mobile, this.otp, this.error, this.errors);

  factory ForgetPasswordResponse.fromJson(Map<String,dynamic>json)=>
      _$ForgetPasswordResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$ForgetPasswordResponseToJson(this);
}

