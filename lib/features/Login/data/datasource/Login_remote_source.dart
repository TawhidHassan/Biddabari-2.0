import 'package:biddabari_new/features/Login/data/models/Auth/ForgetPasswordResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/OtpResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class LoginRemoteSource {

 Future<OtpResponse?> otpGet(String email);

 Future<OtpResponse?>  otpMtch(String mobile, String otp);

 Future<LoginResponse?> login({String? mobile, String? password, String? name});

 Future<LoginResponse?> signUp({String? mobile, String? password, String? name});

 Future<ForgetPasswordResponse?> resetPassword({String? mobile});

 Future<ForgetPasswordResponse?>  passwordChange({ForgetPasswordResponse? datax, String? newPassword, required otp});

}


class LoginRemoteSourceImpl implements LoginRemoteSource {
    final ApiMethod apiMethod;
   LoginRemoteSourceImpl({required this.apiMethod});

  @override
  Future<OtpResponse?> otpGet(String email)async {
    // TODO: implement login
    Map<String, dynamic> data = {

    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.OTP_SEND+"$email",body: data,showResult: true,isBasic: true,duration: 30);
      return OtpResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<OtpResponse?> otpMtch(String mobile, String otp)async {
    // TODO: implement otpMtch
    Map<String, dynamic> data = {
      "mobile_number":mobile,
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.OTP_MATCH,body: data,showResult: true,isBasic: true,duration: 30);
      return OtpResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse?> login({String? mobile, String? password, String? name})async {
    // TODO: implement login
    Map<String, String> data = {
      "name":name??"",
      "mobile": mobile!,
      "password": password??""
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.LOGIN,body: data,showResult: true,isBasic: true,duration: 30);
      return LoginResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse?> signUp({String? mobile, String? password, String? name}) async{
    // TODO: implement signUp
    Map<String, String> data = {
      "mobile": mobile!,
      "name": name!,
      "password": password!

    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.SIGNUP,body: data,showResult: true,isBasic: true,duration: 30);
      return LoginResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ForgetPasswordResponse?> resetPassword({String? mobile})async {
    // TODO: implement resetPassword
    Map<String, String> data = {
      'mobile': mobile!,
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.FORGET_PASSWORD_OTP,body: data,showResult: true,isBasic: true,duration: 30);
      return ForgetPasswordResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ForgetPasswordResponse?> passwordChange({ForgetPasswordResponse? datax, String? newPassword, required otp})async {
    Map<String, dynamic> data = {
      "mobile": datax!.mobile,
      "enc_otp": datax.encoded_otp,
      "otp": otp,
      "password": newPassword
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.FORGET_PASSWORD_CHANGE,body: data,showResult: true,isBasic: true,duration: 30);
      return ForgetPasswordResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
