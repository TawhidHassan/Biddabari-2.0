import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/More/data/models/Order/OrderResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class MoreRepository {
  Future<Either<Failure, OrderResponse>> getMyOrder();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
