import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/Job/data/models/JobResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Job_remote_source.dart';
import '../../domain/repositories/Job_repository.dart';

class JobRepositoryImpl implements JobRepository{

final JobRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

JobRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, JobResponse>> getJobs()async{
    // TODO: implement getJobs
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getJobs();
      if(data!.circulars==null){
        return left(Failure("Somethings wrong"));
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