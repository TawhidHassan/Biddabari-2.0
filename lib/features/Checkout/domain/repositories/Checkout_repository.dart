import 'package:biddabari_new/features/BookStore/data/models/MyBookResponse.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, LoginResponse>> orderCourse({String? type, num? id, required String payment_method, String? trnxId, String? total_amount, String? coupon_code});

  Future<Either<Failure, LoginResponse>> orderExam({String? type, num? id, String? Examid, required String payment_method, String? trnxId, String? total_amount});

  Future<Either<Failure, MyBookResponse>> getDeliveryAddress();

  Future<Either<Failure, LoginResponse>> orderBook({Book? book, required String address, String? type, required String payment_method, String? trnxId, required double delivery});


}
