
import 'package:get/get.dart';
import '../../domain/usecase/Teacher_use_case.dart';


class TeacherController extends GetxController implements GetxService{
  TeacherUseCase? teacherUseCase;
  TeacherController({ teacherUseCase });


}

