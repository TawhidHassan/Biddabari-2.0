
import 'package:get/get.dart';
import '../../domain/usecase/Job_use_case.dart';


class JobController extends GetxController implements GetxService{
  JobUseCase? jobUseCase;
  JobController({ jobUseCase });


}

