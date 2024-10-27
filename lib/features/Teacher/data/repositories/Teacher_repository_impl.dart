import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Teacher/data/models/Teacher/TeacherDetailsResponse.dart';

import 'package:biddabari_new/features/Teacher/data/models/Teacher/TeacherResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Teacher_remote_source.dart';
import '../../domain/repositories/Teacher_repository.dart';

class TeacherRepositoryImpl implements TeacherRepository{

final TeacherRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

TeacherRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, TeacherResponse>> getAllTeacher({required int limit, required String page})async {
    // TODO: implement getAllTeacher
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getAllTeacher(
        limit: limit,
        page: page,
      );
      if(data!.teachers==null){
        return left(Failure("Somethings get wrong"));
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
  Future<Either<Failure, TeacherDetailsResponse>> getTeacherDetails({required int id})async {
    // TODO: implement getTeacherDetails
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getTeacherDetails(
          id:id
        );
        if(data!.teacher==null){
          return left(Failure("Somethings get wrong"));
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