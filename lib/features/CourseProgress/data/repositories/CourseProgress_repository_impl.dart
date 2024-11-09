import 'dart:io';

import 'package:biddabari_new/core/common/data/sucesss/sucess_model.dart';
import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/AllCourse/data/models/course/CourseDetailsResponse.dart';
import 'package:biddabari_new/features/CourseProgress/data/models/Comment/CommentResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionSaveResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/CourseProgress_remote_source.dart';
import '../../domain/repositories/CourseProgress_repository.dart';

class CourseProgressRepositoryImpl implements CourseProgressRepository{

final CourseProgressRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

CourseProgressRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, CourseDetailsResponse>> getCourseContent(String? id)async {
    // TODO: implement getCourseContent
   try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getCourseContent(id);
      if(data!.course==null){
        return left(Failure("Some things wrong"));
      }else{
        return right(data);
      }
      // return right(episodes!.results!);
    }
  }on ServerException catch(e){
    return left(Failure(e.message));
  }
  }

  @override
  Future<Either<Failure, QuestionResponse>> getAssigmentScript(num? id)async {
    // TODO: implement getAssigmentScript
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getAssigmentScript(id);
        if(data!.error!=null){
          return left(Failure("Some things wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, QuestionResponse>> getAssigmentTakenOrNot(int id)async {
    // TODO: implement getAssigmentTakenOrNot
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getAssigmentTakenOrNot(id);
        if(data!.error!=null){
          return left(Failure("Some things wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, QuestionResponse>> submitAssisgment(num? id, List<String> file) async{
    // TODO: implement submitAssisgment
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.submitAssisgment(id,file);
        if(data!.error!=null){
          return left(Failure("Some things wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CommentResponse>> getComments(String id, String type)async {
    // TODO: implement getComments
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getComments(id,type);
        if(data!.comments==null){
          return left(Failure("Some things wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, SucessModel>> commentsSubmitFun(String id, String comment, String type)async {
    // TODO: implement commentsSubmitFun
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.commentsSubmitFun(id,comment,type);
        if(data!.success!='Comment submitted successfully.'){
          return left(Failure("Some things wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, QuestionResponse>> getExamQuestions(String id, int hasExam, bool isCourseExam)async {
    // TODO: implement getExamQuestions
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getExamQuestions(id,hasExam,isCourseExam);
        if(data==null){
          return left(Failure("Some things wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, QuestionSaveResponse>> getMyFavoraiteQuestion(String? id)async {
    // TODO: implement getMyFavoraiteQuestion
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getMyFavoraiteQuestion(id);
        if(data==null){
          return left(Failure("Some things wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

@override
Future<Either<Failure, QuestionResponse>> getExamAnswer({String? id, bool? isCourseExam, bool? isClassExam})async {
  // TODO: implement getExamAnswer
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getExamAnswer(
          id: id,isCourseExam: isCourseExam,isClassExam: isClassExam
      );
      if(data==null){
        return left(Failure("Something wrong"));
      }else{
        return right(data);
      }
      // return right(episodes!.results!);
    }
  }on ServerException catch(e){
    return left(Failure(e.message));
  }
}


@override
  Future<Either<Failure, QuestionResponse>> submitExam(List<File> fileList, bool hasExam, String? id, int minute, String token, Map<String, String> questionsMain, File? file, bool courseExam)async {
    // TODO: implement submitExam
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.submitExam(fileList,hasExam,id,minute,token,questionsMain, file,courseExam);
        if(data.error!=null){
          return left(Failure(data.error!));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> removeQues(int? id, String userId)async {
    // TODO: implement removeQues
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.removeQues(id,userId);
        if(data.success!="Favourite Question deleted Successfully."){
          return left(Failure(data.error!));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> saveQues(int? id, String userId)async {
    // TODO: implement saveQues
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.saveQues(id,userId);
        if(data.success!="Favourite Question Saved Successfully."){
          return left(Failure(data.error!));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }


// @override
}