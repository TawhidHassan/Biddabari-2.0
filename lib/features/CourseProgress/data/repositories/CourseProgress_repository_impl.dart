import 'dart:io';

import 'package:biddabari_new/core/common/data/sucesss/sucess_model.dart';
import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/AllCourse/data/models/course/CourseDetailsResponse.dart';
import 'package:biddabari_new/features/CourseProgress/data/models/Comment/CommentResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';

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


// @override
}