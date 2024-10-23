import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/Notice/data/models/Notice/NoticeResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Notice_remote_source.dart';
import '../../domain/repositories/Notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository{

final NoticeRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

NoticeRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, NoticeResponse>> getNotice()async {
    // TODO: implement getNotice
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getNotice();
      if(data!.notices==null){
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