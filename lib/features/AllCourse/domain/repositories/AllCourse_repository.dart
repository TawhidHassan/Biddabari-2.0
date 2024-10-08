import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class AllCourseRepository {
  Future<Either<Failure, CourseResponse>> getRuningCourse();

}
