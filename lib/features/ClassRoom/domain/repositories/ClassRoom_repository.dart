import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/AllCourse/data/models/Student/CourseOrderResponse.dart';
import 'package:biddabari_new/features/AllCourse/data/models/courseSectionContent/CourseSectionContentResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/TodayExamResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class ClassRoomRepository {
  Future<Either<Failure, CourseOrderResponse>> getMyCourse();

  Future<Either<Failure, CourseSectionContentResponse>> getMyClass();
  Future<Either<Failure, TodayExamResponse>> getTodayExam();



}
