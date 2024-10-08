// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/user/User.dart';
import '../../../../AllCourse/data/models/course/Course.dart';


part 'TeacherDetailsResponse.g.dart';

@JsonSerializable()
class TeacherDetailsResponse{

 User? teacher;
 List<Course>?latestCourses;


 TeacherDetailsResponse(this.teacher, this.latestCourses);

  factory TeacherDetailsResponse.fromJson(Map<String,dynamic>json)=>
      _$TeacherDetailsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$TeacherDetailsResponseToJson(this);
}