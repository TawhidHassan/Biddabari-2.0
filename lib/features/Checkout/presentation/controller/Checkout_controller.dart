
import 'package:get/get.dart';
import '../../domain/usecase/Checkout_use_case.dart';


class CheckoutController extends GetxController implements GetxService{
 final CheckoutUseCase? checkoutUseCase;
  CheckoutController({ this.checkoutUseCase });

  bool isBkashMethodSelected = true;
  final paymentMethod = "".obs;
  bool isOtherMethodSelected = false;

  void selectBkashMethod() {
    isBkashMethodSelected = true;
    isOtherMethodSelected = false;
    update();
  }

  void selectOtherMethod() {
    isOtherMethodSelected = true;
    isBkashMethodSelected = false;
    update();
  }

}

