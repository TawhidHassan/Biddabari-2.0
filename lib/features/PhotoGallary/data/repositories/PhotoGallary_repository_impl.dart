import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryDetailsResponse.dart';

import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/PhotoGallary_remote_source.dart';
import '../../domain/repositories/PhotoGallary_repository.dart';

class PhotoGallaryRepositoryImpl implements PhotoGallaryRepository{

final PhotoGallaryRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

PhotoGallaryRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, GallaryResponse>> getPhotos()async {
    // TODO: implement getPhotos
    try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getPhotos();
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

  @override
  Future<Either<Failure, GallaryDetailsResponse>> getGalleryDetails(int? id)async {
    // TODO: implement getGalleryDetails
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getGalleryDetails(id!);
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



}