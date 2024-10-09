import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';
import 'package:biddabari_new/core/error/failures.dart';
import 'package:fpdart/src/either.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserRresponse>> getProfile();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
