
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../Login/data/models/Auth/LoginResponse.dart';
import '../entities/Checkout.dart';
import '../repositories/Checkout_repository.dart';
import '../../../../core/usecase/usecase.dart';


class CheckoutUseCase implements UseCase<Checkout, GetCheckoutParams> {
final CheckoutRepository? checkoutRepository;
CheckoutUseCase({this.checkoutRepository});
    @override
    Future<Either<Failure, Checkout>> call(GetCheckoutParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

Future<Either<Failure, LoginResponse>>orderCourse({String? type, num? id, required String payment_method, String? trnxId, String? total_amount, String? coupon_code})async {
  return checkoutRepository!.orderCourse(
    type: type,
    id: id,
    payment_method:  payment_method,
    trnxId: trnxId,
    total_amount: total_amount,
    coupon_code: coupon_code,
  );
}


}


class GetCheckoutParams {
final int? page;

GetCheckoutParams({
this.page,

});
}