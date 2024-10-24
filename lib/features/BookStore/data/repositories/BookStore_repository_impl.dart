import 'package:biddabari_new/core/error/failures.dart';

import 'package:biddabari_new/features/BookStore/data/models/BookResponse.dart';
import 'package:biddabari_new/features/BookStore/data/models/MyBookResponse.dart';
import 'package:biddabari_new/features/BookStore/data/models/SingleBookResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/BookStore_remote_source.dart';
import '../../domain/repositories/BookStore_repository.dart';

class BookStoreRepositoryImpl implements BookStoreRepository{

final BookStoreRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

BookStoreRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, BookResponse>> getPopularBok()async {
      // TODO: implement getPopularBok
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getPopularBok();
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
  Future<Either<Failure, BookResponse>> getStoreBok()async {
      // TODO: implement getPopularBok
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getStoreBok();
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
  Future<Either<Failure, MyBookResponse>> getMyBook()async {
      // TODO: implement getPopularBok
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getMyBook();
        if(data!.products==null){
          return left(Failure("some things wrong"));
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
  Future<Either<Failure, SingleBookResponse>> getBookDetails(String id)async {
    // TODO: implement getBookDetails
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getBookDetails(id);
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