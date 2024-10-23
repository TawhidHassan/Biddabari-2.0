import 'package:biddabari_new/features/Notice/data/models/Notice/NoticeResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class NoticeRemoteSource {

 Future<NoticeResponse?> getNotice();

}


class NoticeRemoteSourceImpl implements NoticeRemoteSource {
    final ApiMethod apiMethod;
   NoticeRemoteSourceImpl({required this.apiMethod});

  @override
  Future<NoticeResponse?> getNotice() async{
    // TODO: implement getNotice
  try{
    final result =await apiMethod.get(url: ApiEndpoint.NOTICE_LIST,showResult: true,isBasic: true,duration: 30);
    return NoticeResponse.fromJson(result);
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
