
import 'package:get/get.dart';
import '../../domain/usecase/dwonloads_use_case.dart';


class DwonloadsController extends GetxController implements GetxService{
  final DwonloadsUseCase? dwonloadsUseCase;
  DwonloadsController({ this.dwonloadsUseCase });

  final catetegoryList=["Video","Pdf","Routine"].obs;


}

