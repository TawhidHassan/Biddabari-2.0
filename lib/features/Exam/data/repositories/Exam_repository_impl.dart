import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionSaveResponse.dart';

import 'package:fpdart/fpdart.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Exam_remote_source.dart';
import '../../domain/repositories/Exam_repository.dart';
import '../models/BatchExam/BatchExamResponse.dart';
import '../models/BatchExam/MyExamResponse.dart';

class ExamRepositoryImpl implements ExamRepository{

final ExamRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

ExamRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, BatchExamResponse>> getAllExam()async {
    // TODO: implement getAllExam
      try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getAllExam();
      if(data!.allExams==null){
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
  Future<Either<Failure, ExamDetailsResponse>> getExamDetails(int id)async {
    // TODO: implement getExamDetails
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getExamDetails(id);
        if(data!.exam==null){
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
  Future<Either<Failure, MyExamResponse>> getMyExam()async {
    // TODO: implement getMyExam
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getMyExam();
        if(data!.exams==null){
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
  Future<Either<Failure, QuestionSaveResponse>> getMyFavoraiteQuestion(String id) async{
    // TODO: implement getMyFavoraiteQuestion
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getMyFavoraiteQuestion(id);
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


}