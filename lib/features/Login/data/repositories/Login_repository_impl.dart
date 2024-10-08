import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/ForgetPasswordResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';

import 'package:biddabari_new/features/Login/data/models/Auth/OtpResponse.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Login_remote_source.dart';
import '../../domain/repositories/Login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{

final LoginRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

LoginRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, OtpResponse>> otpGet(String email) async{
    // TODO: implement otpGet
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.otpGet(email);
        if(data!.status!="success"){
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
  Future<Either<Failure, OtpResponse>> otpMtch(String mobile, String otp)async {
    // TODO: implement otpMtch
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.otpMtch(mobile,otp);
        if(data!.status!="success"){
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
  Future<Either<Failure, LoginResponse>> login({String? mobile, String? password, String? name}) async{

    // TODO: implement login
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.login(mobile: mobile,password:password,name: name);
        if(data!.error!=null){
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
  Future<Either<Failure, LoginResponse>> signUp({String? mobile, String? password, String? name}) async{
    // TODO: implement signUp
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.signUp(mobile: mobile,password:password,name: name);
        if(data!.error!=null){
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
  Future<Either<Failure, ForgetPasswordResponse>> resetPassword({String? mobile})async {
    // TODO: implement resetPassword
    // TODO: implement signUp
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.resetPassword(mobile: mobile);
        if(data!.error!=null){
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
  Future<Either<Failure, ForgetPasswordResponse>> passwordChange({ForgetPasswordResponse? datax,
    String? newPassword, required otp})async {
    // TODO: implement passwordChange
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.passwordChange(datax: datax,newPassword:newPassword,otp:otp);
        if(data!.error!=null){
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