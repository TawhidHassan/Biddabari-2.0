
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/AllCourseResponse.dart';
import '../../data/models/CourseCategory/CourseCategoryResponse.dart';
import '../../data/models/Student/CourseOrderResponse.dart';
import '../../data/models/course/CourseDetailsResponse.dart';
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
    @override
    Future<Either<Failure, AllCourseResponse>> getAllCourse() {
    // TODO: implement call
    return allCourseRepository!.getAllCourse();
    }
    @override
    Future<Either<Failure, CourseCategoryResponse>> getCategoryCourse(String? slug)async {
    // TODO: implement call
    return allCourseRepository!.getCategoryCourse(slug);
    }

  Future<Either<Failure, CourseDetailsResponse>>detailsCourse(String? id)async {
      return allCourseRepository!.detailsCourse(id);
  }

  Future<Either<Failure, CourseOrderResponse>>getMyCourse()async {
      return allCourseRepository!.getMyCourse();
  }

  Future<Either<Failure, CourseCategoryResponse>>getFreeService()async {
      return allCourseRepository!.getFreeService();
  }
  Future<Either<Failure, CourseCategoryResponse>>getFreeServiceContent(String? slug)async {
      return allCourseRepository!.getFreeServiceContent(slug);
  }






}


class GetAllCourseParams {
final int? page;

GetAllCourseParams({
this.page,

});
}