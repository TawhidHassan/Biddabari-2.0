
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/OtpResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/Auth/ForgetPasswordResponse.dart';
import '../entities/Login.dart';
import '../repositories/Login_repository.dart';
import '../../../../core/usecase/usecase.dart';


class LoginUseCase implements UseCase<Login, GetLoginParams> {
final LoginRepository? loginRepository;
LoginUseCase({this.loginRepository});
    @override
    Future<Either<Failure, Login>> call(GetLoginParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

  @override
  Future<Either<Failure, OtpResponse>> otpGet(String email)  {
  // TODO: implement call
  return loginRepository!.otpGet(email);
  }

  @override
  Future<Either<Failure, OtpResponse>> otpMtch(String? mobile, String otp)  {
  // TODO: implement call
  return loginRepository!.otpMtch(mobile!,otp);
  }

  @override
  Future<Either<Failure, LoginResponse>>  login({String? mobile, String? password, String? name})   {
  // TODO: implement call
  return loginRepository!.login(mobile: mobile,password:password,name: name);
  }

  @override
  Future<Either<Failure, LoginResponse>>  signUp({String? mobile, String? password, String? name})   {
  // TODO: implement call
  return loginRepository!.signUp(mobile: mobile,password:password,name: name);
  }

  @override
  Future<Either<Failure, ForgetPasswordResponse>>  resetPassword({String? mobile})   {
  // TODO: implement call
  return loginRepository!.resetPassword(mobile: mobile);
  }

  @override
  Future<Either<Failure, ForgetPasswordResponse>>  passwordChange({ForgetPasswordResponse? datax, String? newPassword, required otp})  {
  // TODO: implement call
  return loginRepository!.passwordChange(datax: datax,newPassword:newPassword,otp:otp);
  }








}


class GetLoginParams {
final int? page;

GetLoginParams({
this.page,

});
}