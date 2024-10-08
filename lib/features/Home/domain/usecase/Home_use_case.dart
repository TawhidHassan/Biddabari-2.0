
import 'package:biddabari_new/core/common/data/Category/CategoryResponse.dart';
import 'package:biddabari_new/core/common/data/Slider/SliderResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/Home.dart';
import '../repositories/Home_repository.dart';
import '../../../../core/usecase/usecase.dart';


class HomeUseCase implements UseCase<Home, GetHomeParams> {
final HomeRepository? homeRepository;
HomeUseCase({this.homeRepository});
    @override
    Future<Either<Failure, Home>> call(GetHomeParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }



  @override
  Future<Either<Failure, SliderResponse>> getSlider() {
  // TODO: implement call
  return homeRepository!.getSlider();
  }
  @override
  Future<Either<Failure, CategoryResponse>> getcatgeoryList() {
  // TODO: implement call
  return homeRepository!.getcatgeoryList();
  }


}


class GetHomeParams {
final int? page;

GetHomeParams({
this.page,

});
}