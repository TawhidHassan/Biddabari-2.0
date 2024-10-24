import 'package:biddabari_new/core/error/failures.dart';

import 'package:fpdart/fpdart.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Exam_remote_source.dart';
import '../../domain/repositories/Exam_repository.dart';
import '../models/BatchExam/BatchExamResponse.dart';

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


}