import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../../../BookStore/data/models/MyBookResponse.dart';

abstract class CheckoutRemoteSource {
  Future<LoginResponse?> orderCourse({String? type, num? id, required String payment_method, String? trnxId, String? total_amount, String? coupon_code});

  Future<LoginResponse?> orderExam({String? type, num? id, String? Examid, required String payment_method, String? trnxId, String? total_amount});

  Future<MyBookResponse?> getDeliveryAddress();

  Future<LoginResponse?> orderBook({Book? book, required String address, String? type, required String payment_method, String? trnxId, required double delivery});

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
      final result =await apiMethod.post(url: ApiEndpoint.ORDER_COURSE+"0d",body: data,showResult: true,isBasic: false,duration: 30);
      return LoginResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse?> orderExam({String? type, num? id, String? Examid, required String payment_method, String? trnxId, String? total_amount})async {
    // TODO: implement orderExam
    Map<String, dynamic> data = {
      'parent_model_id': Examid,
      'batch_exam_subscription_id': id,
      'ordered_for': type!,
      'payment_method': payment_method!,
      'vendor': payment_method,
      'paid_to': payment_method,
      'paid_from':"",
      'txt_id': trnxId!,
      'total_amount': total_amount!
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.ORDER_EXAM+"$Examid",body: data,showResult: true,isBasic: false,duration: 30);
      return LoginResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<MyBookResponse?> getDeliveryAddress()async {
    // TODO: implement getDeliveryAddress
    try{
      final result =await apiMethod.get(url: ApiEndpoint.DELIVERY_CHARGE,showResult: true,isBasic: false,duration: 30);
      return MyBookResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse?> orderBook({Book? book, required String address, String? type, required String payment_method, String? trnxId, required double delivery})async {
    // TODO: implement orderBook
    Map<String, String> data = {
    };

    if(payment_method=="ssl"){
      data.addAll({
        'product_orders[0][id]': book!.id.toString(),
        'product_orders[0][shipping_address]': address.toString(),
        'product_orders[0][ordered_for]': type.toString(),
        'product_orders[0][payment_method]': payment_method.toString(),
        'product_orders[0][txt_id]': trnxId.toString(),
        'product_orders[0][price]': ((double.parse(book.price!)-double.parse(book.discount_amount??'0.0'))*1+delivery!).toString()
      });
    }else{
      data.addAll({
        'product_orders[0][id]': book!.id.toString(),
        'product_orders[0][shipping_address]': address.toString(),
        'product_orders[0][ordered_for]': type.toString(),
        'product_orders[0][payment_method]': payment_method.toString(),
        'product_orders[0][vendor]': payment_method.toString(),
        'product_orders[0][paid_to]': "",
        'product_orders[0][paid_from]': "",
        'product_orders[0][txt_id]': trnxId.toString(),
        'product_orders[0][price]': ((double.parse(book.price!)-double.parse(book.discount_amount??'0.0'))*1+delivery!).toString()
      });
    }
    try{
      final result =await apiMethod.multipartMultiFile(url: ApiEndpoint.ORDER_BOOK,body: data,fieldList: [],pathList: [],showResult: true,isBasic: false);
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
