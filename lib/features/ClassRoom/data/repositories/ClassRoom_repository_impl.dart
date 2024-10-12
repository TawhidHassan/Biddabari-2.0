import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/AllCourse/data/models/Student/CourseOrderResponse.dart';
import 'package:biddabari_new/features/AllCourse/data/models/courseSectionContent/CourseSectionContentResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/TodayExamResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/ClassRoom_remote_source.dart';
import '../../domain/repositories/ClassRoom_repository.dart';

class ClassRoomRepositoryImpl implements ClassRoomRepository{

final ClassRoomRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

ClassRoomRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, CourseOrderResponse>> getMyCourse() async{
    // TODO: implement getMyCourse
      try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getMyCourse();
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
  Future<Either<Failure, CourseSectionContentResponse>> getMyClass()async {
    // TODO: implement getMyClass
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getMyClass();
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
  Future<Either<Failure, TodayExamResponse>> getTodayExam()async {
    // TODO: implement getTodayExam
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getTodayExam();
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

}