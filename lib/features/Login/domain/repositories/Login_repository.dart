import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/ForgetPasswordResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/OtpResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class LoginRepository {
  Future<Either<Failure, OtpResponse>> otpGet(String email);

  Future<Either<Failure, OtpResponse>> otpMtch(String mobile, String otp);

  Future<Either<Failure, LoginResponse>> login({String? mobile, String? password, String? name});

  Future<Either<Failure, LoginResponse>> signUp({String? mobile, String? password, String? name});

  Future<Either<Failure, ForgetPasswordResponse>> resetPassword({String? mobile});

  Future<Either<Failure, ForgetPasswordResponse>> passwordChange({ForgetPasswordResponse? datax, String? newPassword, required otp});

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
