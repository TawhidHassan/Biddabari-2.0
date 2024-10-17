
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/dwonloads.dart';
import '../repositories/dwonloads_repository.dart';
import '../../../../core/usecase/usecase.dart';


class DwonloadsUseCase implements UseCase<Dwonloads, GetDwonloadsParams> {
final DwonloadsRepository? dwonloadsRepository;
DwonloadsUseCase({this.dwonloadsRepository});
    @override
    Future<Either<Failure, Dwonloads>> call(GetDwonloadsParams params) {
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


class GetDwonloadsParams {
final int? page;

GetDwonloadsParams({
this.page,

});
}