
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/SaveIteam.dart';
import '../repositories/SaveIteam_repository.dart';
import '../../../../core/usecase/usecase.dart';


class SaveIteamUseCase implements UseCase<SaveIteam, GetSaveIteamParams> {
final SaveIteamRepository? saveIteamRepository;
SaveIteamUseCase({this.saveIteamRepository});
    @override
    Future<Either<Failure, SaveIteam>> call(GetSaveIteamParams params) {
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


class GetSaveIteamParams {
final int? page;

GetSaveIteamParams({
this.page,

});
}