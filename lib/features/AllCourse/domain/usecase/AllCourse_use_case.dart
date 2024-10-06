
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/AllCourse.dart';
import '../repositories/AllCourse_repository.dart';
import '../../../../core/usecase/usecase.dart';


class AllCourseUseCase implements UseCase<AllCourse, GetAllCourseParams> {
final AllCourseRepository? allCourseRepository;
AllCourseUseCase({this.allCourseRepository});
    @override
    Future<Either<Failure, AllCourse>> call(GetAllCourseParams params) {
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


class GetAllCourseParams {
final int? page;

GetAllCourseParams({
this.page,

});
}