import 'dart:io';

import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class ProfileRemoteSource {
  Future<UserRresponse?> getProfile();

  Future<LoginResponse?> updateUser({File? iamge, required String userName, required String firstName, required String lastName, required String email, required String mobile, required String selectGender, required String selectDob});

}


class ProfileRemoteSourceImpl implements ProfileRemoteSource {
    final ApiMethod apiMethod;
   ProfileRemoteSourceImpl({required this.apiMethod});

  @override
  Future<UserRresponse?> getProfile()async {
    // TODO: implement getProfile
    try{
      final result =await apiMethod.get(url: ApiEndpoint.GET_USER_PROFILE,showResult: true,isBasic: false,duration: 30);
      return UserRresponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse?> updateUser({File? iamge, required String userName, required String firstName, required String lastName, required String email, required String mobile, required String selectGender, required String selectDob})async {
    // TODO: implement updateUser
    Map<String, String> data = {
      'name': userName??"",
      'email': email??"",
      'mobile': mobile??"",
      'first_name': firstName??'',
      'last_name': lastName??"",
      'gender': selectGender??"",
      'dob': selectDob??''
    };
  try{
    final result =await apiMethod.multipartMultiFile(url: ApiEndpoint.UPDATE_USER_PROFILE,body: data,showResult: true,isBasic: false, pathList: [iamge==null?"":iamge!.path], fieldList: ["image"]);
    return LoginResponse.fromJson(result!);
  }catch (e) {
    throw ServerException(e.toString());
  }

  }


}
