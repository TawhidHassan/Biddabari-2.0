
import 'package:get/get.dart';
import '../../domain/usecase/BookStore_use_case.dart';


class BookStoreController extends GetxController implements GetxService{
  BookStoreUseCase? bookStoreUseCase;
  BookStoreController({ bookStoreUseCase });


}

