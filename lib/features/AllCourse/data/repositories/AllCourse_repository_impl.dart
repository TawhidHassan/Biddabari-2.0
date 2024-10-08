import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/AllCourse_remote_source.dart';
import '../../domain/repositories/AllCourse_repository.dart';

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

}