import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/Affiliate/AffilitaeResponse.dart';

abstract class AffiliationRemoteSource {
Future<AffilitaeResponse?> createCode();
Future<AffilitaeResponse?> getAffiliation();

}


class AffiliationRemoteSourceImpl implements AffiliationRemoteSource {
    final ApiMethod apiMethod;
   AffiliationRemoteSourceImpl({required this.apiMethod});

  @override
  Future<AffilitaeResponse?> createCode()async {
    // TODO: implement createCode
  try{
    final result =await apiMethod.get(url: ApiEndpoint.AFFILIATION_CREATE,showResult: true,isBasic: false,duration: 30);
    return AffilitaeResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<AffilitaeResponse?> getAffiliation() async{
    // TODO: implement getAffiliation
    try{
      final result =await apiMethod.get(url: ApiEndpoint.AFFILIATION_GET,showResult: true,isBasic: false,duration: 30);
      return AffilitaeResponse.fromJson(result);
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
