import 'package:biddabari_new/core/common/data/Category/CategoryResponse.dart';
import 'package:biddabari_new/core/common/data/Slider/SliderResponse.dart';
import 'package:biddabari_new/core/error/failures.dart';
import 'package:fpdart/src/either.dart';

abstract class HomeRepository {
  Future<Either<Failure, SliderResponse>> getSlider();

  Future<Either<Failure, CategoryResponse>> getcatgeoryList();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
