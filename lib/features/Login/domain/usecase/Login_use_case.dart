
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/Login.dart';
import '../repositories/Login_repository.dart';
import '../../../../core/usecase/usecase.dart';


class LoginUseCase implements UseCase<Login, GetLoginParams> {
final LoginRepository? loginRepository;
LoginUseCase({this.loginRepository});
    @override
    Future<Either<Failure, Login>> call(GetLoginParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetLoginParams {
final int? page;

GetLoginParams({
this.page,

});
}