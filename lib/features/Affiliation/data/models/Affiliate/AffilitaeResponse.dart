// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/user/User.dart';
import '../../../../AllCourse/data/models/course/Course.dart';




part 'AffilitaeResponse.g.dart';

@JsonSerializable()
class AffilitaeResponse{



  User?affiliateRegister;
  dynamic success;
  String? message;
  List<Course>?courses;


  AffilitaeResponse(this.success, this.message, this.courses);

  factory AffilitaeResponse.fromJson(Map<String,dynamic>json)=>
      _$AffilitaeResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$AffilitaeResponseToJson(this);
}