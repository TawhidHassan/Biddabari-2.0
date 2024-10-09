import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';

import 'package:biddabari_new/core/error/failures.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/profile_remote_source.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{

final ProfileRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

ProfileRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, UserRresponse>> getProfile()async {
    // TODO: implement getProfile
    try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getProfile();
      if(data!.success==false){
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