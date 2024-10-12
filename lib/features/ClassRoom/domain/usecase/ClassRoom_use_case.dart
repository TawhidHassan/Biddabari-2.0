
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../AllCourse/data/models/Student/CourseOrderResponse.dart';
import '../../../AllCourse/data/models/courseSectionContent/CourseSectionContentResponse.dart';
import '../../../Exam/data/models/TodayExamResponse.dart';
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



  @override
  Future<Either<Failure, CourseOrderResponse>> getMyCourse() {
  // TODO: implement call
  return classRoomRepository!.getMyCourse();
  }

  @override
  Future<Either<Failure, CourseSectionContentResponse>> getMyClass() {
  // TODO: implement call
  return classRoomRepository!.getMyClass();
  }

  @override
  Future<Either<Failure, TodayExamResponse>> getTodayExam() {
  // TODO: implement call
  return classRoomRepository!.getTodayExam();
  }

}


class GetClassRoomParams {
final int? page;

GetClassRoomParams({
this.page,

});
}