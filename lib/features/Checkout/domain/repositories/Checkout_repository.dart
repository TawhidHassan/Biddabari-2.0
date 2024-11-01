import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, LoginResponse>> orderCourse({String? type, num? id, required String payment_method, String? trnxId, String? total_amount, String? coupon_code});


}
