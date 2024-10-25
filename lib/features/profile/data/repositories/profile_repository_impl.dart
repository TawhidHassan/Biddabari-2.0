import 'dart:io';

import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';

import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';

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

  @override
  Future<Either<Failure, LoginResponse>> updateUser({File? iamge, required String userName, required String firstName, required String lastName, required String email, required String mobile, required String selectGender, required String selectDob})async {
    // TODO: implement updateUser
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.updateUser(
            iamge: iamge,
            userName:userName,
            firstName:firstName,
            lastName:lastName,
            email:email,
            mobile:mobile,
            selectGender:selectGender,
            selectDob:selectDob
        );
        if(data!.success==null){
          return left(Failure(data!.message??""));
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