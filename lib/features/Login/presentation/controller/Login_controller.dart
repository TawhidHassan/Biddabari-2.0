
import 'package:get/get.dart';
import '../../domain/usecase/Login_use_case.dart';


class LoginController extends GetxController implements GetxService{
  LoginUseCase? loginUseCase;
  LoginController({ loginUseCase });


}

