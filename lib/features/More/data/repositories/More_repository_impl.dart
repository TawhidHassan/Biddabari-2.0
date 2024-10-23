import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/More/data/models/Order/OrderResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/More_remote_source.dart';
import '../../domain/repositories/More_repository.dart';

class MoreRepositoryImpl implements MoreRepository{

final MoreRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

MoreRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, OrderResponse>> getMyOrder()async {
    // TODO: implement getMyOrder
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getMyOrder();
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