import 'package:biddabari_new/features/BookStore/data/models/MyBookResponse.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Checkout_remote_source.dart';
import '../../domain/repositories/Checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository{

final CheckoutRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

CheckoutRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, LoginResponse>> orderCourse({String? type, num? id, required String payment_method, String? trnxId, String? total_amount, String? coupon_code})async {
    // TODO: implement orderCourse
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.orderCourse(
        type: type,
        id: id,
        payment_method:  payment_method,
        trnxId: trnxId,
        total_amount: total_amount,
        coupon_code: coupon_code,
      );
      if(data!.error!=null){
        return left(Failure(data.message!));
      }else{
        return right(data);
      }
      // return right(episodes!.results!);
    }
  }on ServerException catch(e){
    return left(Failure(e.message));
  }
  }

  @override
  Future<Either<Failure, LoginResponse>> orderExam({String? type, num? id, String? Examid, required String payment_method, String? trnxId, String? total_amount})async {
    // TODO: implement orderExam
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.orderExam(
          type: type,
          id: id,
          Examid: Examid,
          payment_method:  payment_method,
          trnxId: trnxId,
          total_amount: total_amount,
        );
        if(data!.error!=null){
          return left(Failure(data.message!));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, MyBookResponse>> getDeliveryAddress()async {
    // TODO: implement getDeliveryAddress
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getDeliveryAddress(
        );
        if(data!.deliveryCharge==null){
          return left(Failure("Somethings wrong"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> orderBook({Book? book, required String address, String? type, required String payment_method, String? trnxId, required double delivery})async {
    // TODO: implement orderBook
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.orderBook(
            book:book,
            address: address,
            type: type,
            payment_method: payment_method,
            trnxId: trnxId,
            delivery: delivery
        );
        if(data!.error!=null){
          return left(Failure("Somethings wrong"));
        }else{
          return right(data!);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }


}