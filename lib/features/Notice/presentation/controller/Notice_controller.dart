
import 'package:get/get.dart';
import '../../domain/usecase/Notice_use_case.dart';


class NoticeController extends GetxController implements GetxService{
 final NoticeUseCase? noticeUseCase;
  NoticeController({ this.noticeUseCase });

}

