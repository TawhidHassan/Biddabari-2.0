import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class CheckoutRemoteSource {
  Future<LoginResponse?> orderCourse({String? type, num? id, required String payment_method, String? trnxId, String? total_amount, String? coupon_code});

}


class CheckoutRemoteSourceImpl implements CheckoutRemoteSource {
    final ApiMethod apiMethod;
   CheckoutRemoteSourceImpl({required this.apiMethod});

  @override
  Future<LoginResponse?> orderCourse({String? type, num? id, required String payment_method, String? trnxId, String? total_amount, String? coupon_code})async {
    // TODO: implement orderCourse
    Map<String, dynamic> data = {
      'parent_model_id': id.toString(),
      'ordered_for': type.toString(),
      'payment_method': payment_method.toString(),
      'vendor': payment_method.toString(),
      'paid_to': "",
      'paid_from': "",
      'txt_id': trnxId.toString(),
      'total_amount': total_amount.toString(),
      'coupon_code':coupon_code??""
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.ORDER_COURSE+"$id",body: data,showResult: true,isBasic: false,duration: 30);
      return LoginResponse.fromJson(result!);
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
