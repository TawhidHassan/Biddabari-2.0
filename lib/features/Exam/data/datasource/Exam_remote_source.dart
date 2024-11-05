
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/ExamResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/BatchExam/BatchExamResponse.dart';
import '../models/BatchExam/MyExamResponse.dart';
import '../models/Question/QuestionSaveResponse.dart';

abstract class ExamRemoteSource {

Future<BatchExamResponse?> getAllExam();
Future<ExamDetailsResponse?>getExamDetails(int id);
Future<MyExamResponse?>getMyExam();
Future<QuestionSaveResponse?> getMyFavoraiteQuestion(String id);
Future<QuestionResponse?> getExamAnswer({String? id, bool? isCourseExam, bool? isClassExam});
Future<ExamResponse?> getCourseExamRanking({String? id, bool? isCourseExam});
Future<MyExamResponse?> getMyExamSection({int? id});
Future<MyExamResponse?> getMasterExam({int? id});









}


class ExamRemoteSourceImpl implements ExamRemoteSource {
    final ApiMethod apiMethod;
   ExamRemoteSourceImpl({required this.apiMethod});

  @override
  Future<BatchExamResponse?> getAllExam() async{
    // TODO: implement getAllExam
  try{
    final result =await apiMethod.get(url: ApiEndpoint.BATCH_EXAM_LIST,showResult: true,isBasic: true,duration: 30);
    return BatchExamResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<ExamDetailsResponse?> getExamDetails(int id)async {
    // TODO: implement getExamDetails
    try{
      final result =await apiMethod.get(url: ApiEndpoint.BATCH_EXAM_DETAILS+"$id",showResult: true,isBasic: true,duration: 30);
      return ExamDetailsResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<MyExamResponse?> getMyExam()async {
    // TODO: implement getMyExam
    try{
      final result =await apiMethod.get(url: ApiEndpoint.MY_BATCH_EXAM,showResult: true,isBasic: false,duration: 30);
      return MyExamResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<QuestionSaveResponse?> getMyFavoraiteQuestion(String id)async {
    // TODO: implement getMyFavoraiteQuestion
    try{
      final result =await apiMethod.get(url:ApiEndpoint.FAVORAITE_QUESTION_LIST+"$id",showResult: true,isBasic: false,duration: 30);
      return QuestionSaveResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<QuestionResponse?> getExamAnswer({String? id, bool? isCourseExam, bool? isClassExam})async {
    // TODO: implement getExamAnswer
    try{
      final result =await apiMethod.get(url:
      isClassExam!?
          ApiEndpoint.ANSWER_CLASS_EXAM+"$id"
          :
          isCourseExam!?
          ApiEndpoint.ANSWER_COURSE_EXAM+"$id"
          :
          ApiEndpoint.ANSWER_BATCH_EXAM+"$id",
          showResult: true,isBasic: false,duration: 30);
      return QuestionResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ExamResponse?> getCourseExamRanking({String? id, bool? isCourseExam})async {
    // TODO: implement getCourseExamRanking
    try{
      final result =await apiMethod.get(url:
          isCourseExam!? ApiEndpoint.RANK_COURSE_EXAM+"$id":ApiEndpoint.RANK_COURSE_EXAM+"$id",
          showResult: true,isBasic: false,duration: 30);
      return ExamResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<MyExamResponse?> getMyExamSection({int? id})async {
    // TODO: implement getMyExamSection
    try{
      final result =await apiMethod.get(url: ApiEndpoint.MY_BATCH_SECTION_LIST+"$id",
          showResult: true,isBasic: false,duration: 30);
      return MyExamResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }
  @override
  Future<MyExamResponse?> getMasterExam({int? id})async {
    // TODO: implement getMyExamSection
    try{
      final result =await apiMethod.get(url: ApiEndpoint.MY_BATCH_SECTION_LIST+"$id",
          showResult: true,isBasic: false,duration: 30);
      return MyExamResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }


}
