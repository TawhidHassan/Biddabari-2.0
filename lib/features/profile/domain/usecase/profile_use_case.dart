
import 'dart:io';

import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../Login/data/models/Auth/LoginResponse.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';
import '../../../../core/usecase/usecase.dart';


class ProfileUseCase implements UseCase<Profile, GetProfileParams> {
final ProfileRepository? profileRepository;
ProfileUseCase({this.profileRepository});
    @override
    Future<Either<Failure, Profile>> call(GetProfileParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }



  @override
  Future<Either<Failure, UserRresponse>> getProfile() {
  // TODO: implement call
  return profileRepository!.getProfile();
  }

  Future<Either<Failure, LoginResponse>> updateUser({File? iamge, required String userName, required String firstName, required String lastName, required String email, required String mobile, required String selectGender, required String selectDob}) {
    return profileRepository!.updateUser(
        iamge: iamge,
        userName:userName,
        firstName:firstName,
        lastName:lastName,
        email:email,
        mobile:mobile,
        selectGender:selectGender,
        selectDob:selectDob
    );
  }

}


class GetProfileParams {
final int? page;

GetProfileParams({
this.page,

});
}