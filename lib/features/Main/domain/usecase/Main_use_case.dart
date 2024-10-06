
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/Main.dart';
import '../repositories/Main_repository.dart';
import '../../../../core/usecase/usecase.dart';


class MainUseCase implements UseCase<Main, GetMainParams> {
final MainRepository? mainRepository;
MainUseCase({this.mainRepository});
    @override
    Future<Either<Failure, Main>> call(GetMainParams params) {
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


class GetMainParams {
final int? page;

GetMainParams({
this.page,

});
}