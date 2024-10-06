
import 'package:get/get.dart';
import '../../domain/usecase/Exam_use_case.dart';


class ExamController extends GetxController implements GetxService{
  ExamUseCase? examUseCase;
  ExamController({ examUseCase });


}

