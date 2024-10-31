import 'dart:io';

import 'package:biddabari_new/core/common/data/sucesss/sucess_model.dart';
import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseDetailsResponse.dart';
import 'package:biddabari_new/features/CourseProgress/data/models/Comment/CommentResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class CourseProgressRepository {
  Future<Either<Failure, CourseDetailsResponse>> getCourseContent(String? id);

  Future<Either<Failure, QuestionResponse>> getAssigmentScript(num? id);

  Future<Either<Failure, QuestionResponse>> getAssigmentTakenOrNot(int id);

  Future<Either<Failure, QuestionResponse>> submitAssisgment(num? id,List<String> file);

  Future<Either<Failure, CommentResponse>> getComments(String id, String type);

  Future<Either<Failure, SucessModel>> commentsSubmitFun(String id, String comment, String type);

  Future<Either<Failure, QuestionResponse>> getExamQuestions(String id, int hasExam, bool isCourseExam);

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
