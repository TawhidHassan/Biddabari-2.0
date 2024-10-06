
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/Home/presentation/controller/Home_controller.dart';
import '../../features/Login/presentation/controller/Login_controller.dart';
import '../../features/Main/presentation/controller/Main_controller.dart';
import '../../features/Splash/presentation/controller/Splash_controller.dart';
import '../init_dependencies.dart';


Future<Map<String, Map<String, String>>> init() async {

  // var apiclient=getIt<ApiClient>();
  // var localDb=getIt<LocalDataGet>();
  // print("calll get x");
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);
  // Get.lazyPut(() => ApiClient(appBaseUrl: BASE_URL));


  // Repositor

  ///------------ Controller ------------------>>>

  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => HomeController(homeUseCase: serviceLocator()));
  Get.lazyPut(()=> MainController(mainUseCase: serviceLocator()));
  Get.lazyPut(() => LoginController(loginUseCase: serviceLocator()));





  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}