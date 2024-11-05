
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../../Dependenci Injection/init_dependencies.dart';
import '../../../../core/LocalDataBase/AddressLocal/AddressLocal.dart';
import '../../../../core/config/Strings/app_strings.dart';
import '../../../../core/service/hive_service.dart';
import '../../domain/usecase/dwonloads_use_case.dart';


class DwonloadsController extends GetxController implements GetxService{
  final DwonloadsUseCase? dwonloadsUseCase;
  DwonloadsController({ this.dwonloadsUseCase });

  final catetegoryList=["Video","Pdf"].obs;
  final selectCat="Pdf".obs;

  RxList<AddressLocal>? addressList=RxList<AddressLocal>();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

  }

  Future<void> fetchAddressList() async {
    await serviceLocator<HiveService>().openBox<AddressLocal>(AppStrings.ADDRESS_BOX);
    addressList!.value.assignAll(Hive.box<AddressLocal>(AppStrings.ADDRESS_BOX).values.toList()); // Load initial data
  }
}

