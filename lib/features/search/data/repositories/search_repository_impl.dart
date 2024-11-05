import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/search/data/models/search_model.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/search_remote_source.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{

final SearchRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

SearchRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, SearchModel>> searchGet(String text)async {
    // TODO: implement searchGet
   try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.searchGet(text);
      if(data!.courses==null){
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