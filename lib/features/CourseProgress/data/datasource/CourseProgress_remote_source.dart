import 'dart:io';

import 'package:biddabari_new/features/AllCourse/data/models/course/CourseDetailsResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class CourseProgressRemoteSource {
Future<CourseDetailsResponse?> getCourseContent(String? id);
Future<QuestionResponse?> getAssigmentScript(num? id);
Future<QuestionResponse?> getAssigmentTakenOrNot(int? id);
Future<QuestionResponse?>submitAssisgment(num? id, List<String> file);


}


class CourseProgressRemoteSourceImpl implements CourseProgressRemoteSource {
    final ApiMethod apiMethod;
   CourseProgressRemoteSourceImpl({required this.apiMethod});

  @override
  Future<CourseDetailsResponse?> getCourseContent(String? id)async {
    // TODO: implement getCourseContent
  try{
    final result =await apiMethod.get(url: ApiEndpoint.COURSE_CONTENT_LIST+"$id",showResult: true,isBasic: false,duration: 30);
    return CourseDetailsResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<QuestionResponse?> getAssigmentScript(num? id)async {
    // TODO: implement getAssigmentScript
    try{
      final result =await apiMethod.get(url: ApiEndpoint.ASSIGMENT_SCRIPT_GET+"$id/assignment",showResult: true,isBasic: false,duration: 30);
      return QuestionResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<QuestionResponse?> getAssigmentTakenOrNot(int? id)async {
    // TODO: implement getAssigmentTakenOrNot
    try{
      final result =await apiMethod.get(url: ApiEndpoint.ASSIGMENT_SCRIPT_TAKEN_OR_NOT+"$id",showResult: true,isBasic: false,duration: 30);
      return QuestionResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<QuestionResponse?> submitAssisgment(num? id, List<String> file)async {
    Map<String, String> data = {
      'course_content_id': id.toString()
    };
  try{
    final result =await apiMethod.multipartMultiFile(url: ApiEndpoint.ASSIGMENT_SUBMIT,body: data,showResult: true,isBasic: true, pathList: file, fieldList: ["files[]"]);
    return QuestionResponse.fromJson(result!);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

}
