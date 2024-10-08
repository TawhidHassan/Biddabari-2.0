
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/Teacher/Teacher.dart';
import '../entities/Teacher.dart';
import '../repositories/Teacher_repository.dart';
import '../../../../core/usecase/usecase.dart';


class TeacherUseCase implements UseCase<Teacher, GetTeacherParams> {
final TeacherRepository? teacherRepository;
TeacherUseCase({this.teacherRepository});
    @override
    Future<Either<Failure, Teacher>> call(GetTeacherParams params) {
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


class GetTeacherParams {
final int? page;

GetTeacherParams({
this.page,

});
}