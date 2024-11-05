import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/Affiliation/data/models/Affiliate/AffilitaeResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Affiliation_remote_source.dart';
import '../../domain/repositories/Affiliation_repository.dart';

class AffiliationRepositoryImpl implements AffiliationRepository{

final AffiliationRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

AffiliationRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, AffilitaeResponse>> createCode()async {
    // TODO: implement createCode
      try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.createCode();
      if(data==null){
        return left(Failure(data!.message!));
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
  Future<Either<Failure, AffilitaeResponse>> getAffiliation()async {
    // TODO: implement getAffiliation
      try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getAffiliation();
      if(data==null){
        return left(Failure(data!.message!));
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
// Future<Either<Failure, LoginResponseModel>> login(String email,String deviceToken, String pass, bool isPG) async{
//   // TODO: implement login
//   try{
//     if (!await (connectionChecker.isConnected)) {
//       return left(Failure("no internet connection!!"));
//     }else{
//       final data = await remoteSource.login(email,deviceToken,pass,isPG);
//       if(data!.status!="success"){
//         return left(Failure(data.message!));
//       }else{
//         return right(data);
//       }
//       // return right(episodes!.results!);
//     }
//   }on ServerException catch(e){
//     return left(Failure(e.message));
//   }
// }
}