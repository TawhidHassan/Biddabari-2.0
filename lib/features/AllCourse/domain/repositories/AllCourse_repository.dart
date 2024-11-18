import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/AllCourse/data/models/AllCourseResponse.dart';
import 'package:biddabari_new/features/AllCourse/data/models/Student/CourseOrderResponse.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseDetailsResponse.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';
import 'package:fpdart/src/either.dart';

import '../../data/models/CourseCategory/CourseCategoryResponse.dart';

abstract class AllCourseRepository {
  Future<Either<Failure, CourseResponse>> getRuningCourse();

  Future<Either<Failure, AllCourseResponse>> getAllCourse(int? page) ;

  Future<Either<Failure, CourseCategoryResponse>> getCategoryCourse(String? slug);
  Future<Either<Failure, CourseDetailsResponse>> detailsCourse(String? slug);

  Future<Either<Failure, CourseOrderResponse>> getMyCourse();

  Future<Either<Failure, CourseCategoryResponse>> getFreeService();
  Future<Either<Failure, CourseCategoryResponse>>getFreeServiceContent(String? slug);

  Future<Either<Failure, CourseResponse>> getAllPopularCourse();



}
