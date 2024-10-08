
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';
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

    @override
    Future<Either<Failure, CourseResponse>> getRuningCourse() {
    // TODO: implement call
    return allCourseRepository!.getRuningCourse();
    }

}


class GetAllCourseParams {
final int? page;

GetAllCourseParams({
this.page,

});
}