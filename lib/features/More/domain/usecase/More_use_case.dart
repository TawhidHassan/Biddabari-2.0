
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/More.dart';
import '../repositories/More_repository.dart';
import '../../../../core/usecase/usecase.dart';


class MoreUseCase implements UseCase<More, GetMoreParams> {
final MoreRepository? moreRepository;
MoreUseCase({this.moreRepository});
    @override
    Future<Either<Failure, More>> call(GetMoreParams params) {
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


class GetMoreParams {
final int? page;

GetMoreParams({
this.page,

});
}