
import 'package:get/get.dart';
import '../../domain/usecase/Home_use_case.dart';


class HomeController extends GetxController implements GetxService{
  HomeUseCase? homeUseCase;
  HomeController({ homeUseCase });


}

