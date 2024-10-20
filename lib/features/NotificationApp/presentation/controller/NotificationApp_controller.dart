
import 'package:get/get.dart';
import '../../domain/usecase/NotificationApp_use_case.dart';


class NotificationAppController extends GetxController implements GetxService{
  final NotificationAppUseCase? notificationAppUseCase;
  NotificationAppController({ this.notificationAppUseCase });


}

