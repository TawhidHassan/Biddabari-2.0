import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/Blog/data/models/Blog/BlogResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Blog_remote_source.dart';
import '../../domain/repositories/Blog_repository.dart';
import '../models/Blog/BlogDetailsResponse.dart';

class BlogRepositoryImpl implements BlogRepository{

final BlogRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

BlogRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, BlogResponse>> getBlogs(int limit, String page)async {
    // TODO: implement getBlogs
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getBlogs(limit,page);
      if(data!.blogCategories==null){
        return left(Failure("somethings wrong"));
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
  Future<Either<Failure, BlogDetailsResponse>> getBlogDetails(int id)async {
    // TODO: implement getBlogDetails
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getBlogDetails(id);
        if(data!.blog==null){
          return left(Failure("somethings wrong"));
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