
import 'package:get/get.dart';
import '../../domain/usecase/Blog_use_case.dart';


class BlogController extends GetxController implements GetxService{
 final BlogUseCase? blogUseCase;
  BlogController({ this.blogUseCase });


}

