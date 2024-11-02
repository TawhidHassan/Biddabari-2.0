
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../BookStore/data/models/MyBookResponse.dart';
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

Future<Either<Failure, LoginResponse>>  orderExam({String? type, num? id, String? Examid, required String payment_method, String? trnxId, String? total_amount}) async {
  return checkoutRepository!.orderExam(
    type: type,
    id: id,
    Examid: Examid,
    payment_method:  payment_method,
    trnxId: trnxId,
    total_amount: total_amount,
  );
}

Future<Either<Failure, MyBookResponse>> getDeliveryAddress() async{
  return checkoutRepository!.getDeliveryAddress();
}

Future<Either<Failure, LoginResponse>>  orderBook({Book? book, required String address, String? type, required String payment_method, String? trnxId, required double delivery})async {
  return checkoutRepository!.orderBook(
      book:book,
      address: address,
      type: type,
      payment_method: payment_method,
      trnxId: trnxId,
      delivery: delivery
  );
}



}


class GetCheckoutParams {
final int? page;

GetCheckoutParams({
this.page,

});
}