import 'package:biddabari_new/features/More/data/models/Order/OrderResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class MoreRemoteSource {

Future<OrderResponse?> getMyOrder();

}


class MoreRemoteSourceImpl implements MoreRemoteSource {
    final ApiMethod apiMethod;
   MoreRemoteSourceImpl({required this.apiMethod});

  @override
  Future<OrderResponse?> getMyOrder()async {
    // TODO: implement getMyOrder
  try{
    final result =await apiMethod.get(url: ApiEndpoint.ORDER_LIST,showResult: true,isBasic: false,duration: 30);
    return OrderResponse.fromJson(result);
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
