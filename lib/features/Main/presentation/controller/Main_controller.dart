
import 'package:get/get.dart';
import '../../domain/usecase/Main_use_case.dart';


class MainController extends GetxController implements GetxService{
  MainUseCase? mainUseCase;
  MainController({ mainUseCase });


}

