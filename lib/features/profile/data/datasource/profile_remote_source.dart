import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class ProfileRemoteSource {
  Future<UserRresponse?> getProfile();

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

// @override
// Future<LoginResponseModel?> login(String email,String deviceToken, String pass, bool isPg)async {
//
//   Map<String, dynamic> data = {
//   "email":email,
//   "password":pass,
//   "isPG":isPg,
//   "mobileToken":deviceToken
//   };
//   try{
//     final result =await apiMethod.post(url: ApiEndpoint.LOGIN,body: data,showResult: true,isBasic: true,duration: 30);
//     return LoginResponseModel.fromJson(result);
//   }catch (e) {
//     throw ServerException(e.toString());
//   }
// }
}
