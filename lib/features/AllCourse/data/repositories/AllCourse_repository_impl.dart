import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/AllCourse/data/models/AllCourseResponse.dart';

import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/AllCourse_remote_source.dart';
import '../../domain/repositories/AllCourse_repository.dart';
import '../models/CourseCategory/CourseCategoryResponse.dart';

class AllCourseRepositoryImpl implements AllCourseRepository{

final AllCourseRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

AllCourseRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, CourseResponse>> getRuningCourse()async {
    // TODO: implement getRuningCourse
     try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getRuningCourse();
        if(data!.success==false){
          return left(Failure(data.message!));
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
  Future<Either<Failure, AllCourseResponse>> getAllCourse()async {
    // TODO: implement getAllCourse
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getAllCourse();
        if(data!.courseCategories==null){
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
  Future<Either<Failure, CourseCategoryResponse>> getCategoryCourse(String? slug)async {
    // TODO: implement getCategoryCourse
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getCategoryCourse(slug);
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