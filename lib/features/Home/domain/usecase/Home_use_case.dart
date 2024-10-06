
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

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetHomeParams {
final int? page;

GetHomeParams({
this.page,

});
}