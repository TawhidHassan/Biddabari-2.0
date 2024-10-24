import 'package:biddabari_new/features/BookStore/data/models/BookResponse.dart';
import 'package:biddabari_new/features/BookStore/data/models/MyBookResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/SingleBookResponse.dart';

abstract class BookStoreRemoteSource {
  Future<BookResponse?> getPopularBok();
  Future<SingleBookResponse?>getBookDetails(String id);
  Future<BookResponse?> getStoreBok();
  Future<MyBookResponse?> getMyBook();




}


class BookStoreRemoteSourceImpl implements BookStoreRemoteSource {
    final ApiMethod apiMethod;
   BookStoreRemoteSourceImpl({required this.apiMethod});

  @override
  Future<BookResponse?> getPopularBok()async {
    // TODO: implement getPopularBok
    try{
      final result =await apiMethod.get(url: ApiEndpoint.TOP_BOOK_LIST,showResult: true,isBasic: true,duration: 30);
      return BookResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }
  @override
  Future<BookResponse?> getStoreBok()async {
    // TODO: implement getPopularBok
    try{
      final result =await apiMethod.get(url: ApiEndpoint.STORE_BOOK_LIST,showResult: true,isBasic: true,duration: 30);
      return BookResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<SingleBookResponse?> getBookDetails(String id)async {
    // TODO: implement getBookDetails
    try{
      final result =await apiMethod.get(url: ApiEndpoint.STORE_BOOK_DETAILS+"$id",showResult: true,isBasic: true,duration: 30);
      return SingleBookResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<MyBookResponse?> getMyBook()async {
    // TODO: implement getMyBook
    try{
      final result =await apiMethod.get(url: ApiEndpoint.MY_BOOK_LIST,showResult: true,isBasic: false,duration: 30);
      return MyBookResponse.fromJson(result!);
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
