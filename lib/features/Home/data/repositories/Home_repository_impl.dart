import 'package:biddabari_new/core/common/data/Category/CategoryResponse.dart';

import 'package:biddabari_new/core/common/data/Slider/SliderResponse.dart';

import 'package:biddabari_new/core/error/failures.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Home_remote_source.dart';
import '../../domain/repositories/Home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{

final HomeRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

HomeRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, SliderResponse>> getSlider()async {
    // TODO: implement getSlider
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getSlider();
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
  Future<Either<Failure, CategoryResponse>> getcatgeoryList()async {
    // TODO: implement getcatgeoryList
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getcatgeoryList();
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