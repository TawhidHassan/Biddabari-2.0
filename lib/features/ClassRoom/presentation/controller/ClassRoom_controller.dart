
import 'package:get/get.dart';
import '../../domain/usecase/ClassRoom_use_case.dart';


class ClassRoomController extends GetxController implements GetxService{
  ClassRoomUseCase? classRoomUseCase;
  ClassRoomController({ classRoomUseCase });


}

