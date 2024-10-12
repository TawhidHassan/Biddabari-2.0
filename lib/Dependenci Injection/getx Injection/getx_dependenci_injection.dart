
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:biddabari_new/features/ClassRoom/presentation/controller/ClassRoom_controller.dart';
import 'package:biddabari_new/features/Teacher/presentation/controller/Teacher_controller.dart';
import 'package:biddabari_new/features/profile/presentation/controller/profile_controller.dart';
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
  Get.lazyPut(() => LoginController(loginUseCase: serviceLocator()));
  Get.lazyPut(() => HomeController(homeUseCase: serviceLocator()));
  Get.lazyPut(()=> MainController(mainUseCase: serviceLocator()));
  Get.lazyPut(() => AllCourseController(allCourseUseCase: serviceLocator()));
  Get.lazyPut(() => BookStoreController(bookStoreUseCase: serviceLocator()));
  Get.lazyPut(() => ProfileController(profileUseCase: serviceLocator()));
  Get.lazyPut(() => TeacherController(teacherUseCase: serviceLocator()));
  Get.lazyPut(() => ClassRoomController(classRoomUseCase: serviceLocator()));





  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}