import 'dart:io';

import 'package:biddabari_new/core/common/data/sucesss/sucess_model.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseDetailsResponse.dart';
import 'package:biddabari_new/features/CourseProgress/data/models/Comment/CommentResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionSaveResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class CourseProgressRemoteSource {
Future<CourseDetailsResponse?> getCourseContent(String? id);
Future<QuestionResponse?> getAssigmentScript(num? id);
Future<QuestionResponse?> getAssigmentTakenOrNot(int? id);
Future<QuestionResponse?>submitAssisgment(num? id, List<String> file);
Future<CommentResponse?>getComments (String id, String type);
Future<SucessModel?> commentsSubmitFun(String id, String comment, String type);

Future<QuestionResponse?>getExamQuestions(String id, int hasExam, bool isCourseExam);
Future<QuestionSaveResponse?>getMyFavoraiteQuestion(String? id);

Future<QuestionResponse> submitExam(List<File> fileList, bool hasExam, String? id, int minute, String token, Map<String, String> questionsMain, File? file, bool courseExam);

Future<LoginResponse> saveQues(int? id, String userId);
Future<LoginResponse> removeQues(int? id, String userId);











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
    final result =await apiMethod.multipartMultiFile(url: ApiEndpoint.ASSIGMENT_SUBMIT,body: data,showResult: true,isBasic: false, pathList: file, fieldList: ["files[]"]);
    return QuestionResponse.fromJson(result!);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<CommentResponse?> getComments(String id, String type)async{
    // TODO: implement getComments
    try{
      final result =await apiMethod.get(url: ApiEndpoint.GET_CONTENT_COMMENT+"/$id/$type",showResult: true,isBasic: false,duration: 30);
      return CommentResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<SucessModel?> commentsSubmitFun(String id, String comment, String type)async {
    // TODO: implement commentsSubmitFun
    Map<String, String> data =
    type=="course_content"?
    {
      "message": comment,
      "type": type,
      "parent_model_id": id,
    }:{
      "message": comment,
      "type": type,
      "parent_model_id": id,
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.SUBMIT_CONTENT_COMMENT,body: data,showResult: true,isBasic: false,);
      return SucessModel.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<QuestionResponse?> getExamQuestions(String id, int hasExam, bool isCourseExam)async {
    // TODO: implement getExamQuestions
    try{
      if(hasExam==1){
        final result =await apiMethod.get(url: ApiEndpoint.START_CLASS_EXAM+"/$id",showResult: true,isBasic: false,duration: 30);
        return QuestionResponse.fromJson(result);
      }else{
        final result =await apiMethod.get(url:isCourseExam? ApiEndpoint.START_COURSE_EXAM+"/$id": ApiEndpoint.START_BATCH_EXAM+"/$id",showResult: true,isBasic: false,duration: 30);
        return QuestionResponse.fromJson(result);
      }

    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<QuestionSaveResponse?> getMyFavoraiteQuestion(String? id) async{
    // TODO: implement getMyFavoraiteQuestion
    try{
        final result =await apiMethod.get(url:ApiEndpoint.FAVORAITE_QUESTION_LIST+"$id",showResult: true,isBasic: false,duration: 30);
        return QuestionSaveResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<QuestionResponse> submitExam(List<File> fileList, bool hasExam, String? id, int minute, String token, Map<String, String> questionsMain, File? file, bool courseExam)async {
    // TODO: implement submitExam
    List<String> fileListPath=<String>[];
    fileList.forEach((element) {
      fileListPath.add(element.path);
    });

    try{
      final result =await apiMethod.multipartMultiFile(
          url:hasExam!? courseExam? ApiEndpoint.COURSE_EXAM_RESULT_SUBMIT+"$id":
          ApiEndpoint.COURSE_BATCH_EXAM_RESULT_SUBMIT+"$id":
          ApiEndpoint.COURSE_CLASS_EXAM_RESULT_SUBMIT+"$id",

          body: questionsMain,showResult: true,isBasic: false, pathList: fileListPath, fieldList:fileListPath.isEmpty?[]: ["ans_files[]"]);
      return QuestionResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse> removeQues(int? id, String userId)async {
    // TODO: implement removeQues

    try{
      final result =await apiMethod.get(url: ApiEndpoint.REMOVE_QUESTION+"$userId/$id",showResult: true,isBasic: false,);
      return LoginResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse> saveQues(int? id, String userId)async {
    // TODO: implement saveQues
    try{
      final result =await apiMethod.get(url: ApiEndpoint.SAVE_QUESTION+"$userId/$id",showResult: true,isBasic: false,);
      return LoginResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
