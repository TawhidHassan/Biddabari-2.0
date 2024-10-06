
import 'package:biddabari_new/features/Splash/data/models/splash_model.dart';
import 'package:get/get.dart';
import '../../../../Dependenci Injection/init_dependencies.dart';
import '../../../../core/LocalDataBase/localdata.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../domain/usecase/Splash_use_case.dart';


class SplashController extends GetxController implements GetxService{
  final SplashUseCase? splashUseCase;
  SplashController({ this.splashUseCase });

  final List<SplashModel> contents = [
    SplashModel(
        "Education is the best learn ever",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
        0xFFDEE9FF,
       Assets.images.onboarding1.path
    ),
    SplashModel(
        "Education is the best learn ever",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
        0xFFFCECDB,
        Assets.images.onboarding2.path

    ),
    SplashModel(
        "Education is the best learn ever",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
        0xFFE5FFD8,
        Assets.images.onboarding3.path

    ),
  ];

  DBHelper dbHelper=serviceLocator();

  final index = 0.obs;
  void updateSelectedIndex(int length){
    if(index < length-1){
      index.value++;
    }else{
      index.value= 0;
    }
    update();
  }

}

