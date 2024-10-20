
import 'package:get/get.dart';
import '../../domain/usecase/SaveIteam_use_case.dart';


class SaveIteamController extends GetxController implements GetxService{
  final SaveIteamUseCase? saveIteamUseCase;
  SaveIteamController({ this.saveIteamUseCase });


}

