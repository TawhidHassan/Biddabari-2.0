
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/Splash.dart';
import '../repositories/Splash_repository.dart';
import '../../../../core/usecase/usecase.dart';


class SplashUseCase implements UseCase<Splash, GetSplashParams> {
final SplashRepository? splashRepository;
SplashUseCase({this.splashRepository});
    @override
    Future<Either<Failure, Splash>> call(GetSplashParams params) {
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


class GetSplashParams {
final int? page;

GetSplashParams({
this.page,

});
}