import 'dart:io';

import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';
import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserRresponse>> getProfile();

  Future<Either<Failure, LoginResponse>> updateUser({File? iamge, required String userName, required String firstName, required String lastName, required String email, required String mobile, required String selectGender, required String selectDob});

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
