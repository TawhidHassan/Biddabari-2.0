
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/ClassRoom.dart';
import '../repositories/ClassRoom_repository.dart';
import '../../../../core/usecase/usecase.dart';


class ClassRoomUseCase implements UseCase<ClassRoom, GetClassRoomParams> {
final ClassRoomRepository? classRoomRepository;
ClassRoomUseCase({this.classRoomRepository});
    @override
    Future<Either<Failure, ClassRoom>> call(GetClassRoomParams params) {
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


class GetClassRoomParams {
final int? page;

GetClassRoomParams({
this.page,

});
}