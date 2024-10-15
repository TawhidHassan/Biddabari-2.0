
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
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

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetCheckoutParams {
final int? page;

GetCheckoutParams({
this.page,

});
}