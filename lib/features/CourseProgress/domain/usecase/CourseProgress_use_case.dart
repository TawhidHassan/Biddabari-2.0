
import 'dart:io';

import 'package:biddabari_new/core/common/data/sucesss/sucess_model.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseDetailsResponse.dart';
import 'package:biddabari_new/features/AllCourse/presentation/widget/course_details_idecator.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../Exam/data/models/Question/QuestionResponse.dart';
import '../../data/models/Comment/CommentResponse.dart';
import '../entities/CourseProgress.dart';
import '../repositories/CourseProgress_repository.dart';
import '../../../../core/usecase/usecase.dart';


class CourseProgressUseCase implements UseCase<CourseProgress, GetCourseProgressParams> {
final CourseProgressRepository? courseProgressRepository;
CourseProgressUseCase({this.courseProgressRepository});
    @override
    Future<Either<Failure, CourseProgress>> call(GetCourseProgressParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }




  @override
  Future<Either<Failure, CourseDetailsResponse>> getCourseContent(String? id) {
  // TODO: implement call
  return courseProgressRepository!.getCourseContent(id);
  }

  @override
  Future<Either<Failure, QuestionResponse>> getAssigmentScript(num? id) {
  // TODO: implement call
  return courseProgressRepository!.getAssigmentScript(id);
  }

@override
Future<Either<Failure, QuestionResponse>> getAssigmentTakenOrNot(int id)async {
  return courseProgressRepository!.getAssigmentTakenOrNot(id);
}

Future<Either<Failure, QuestionResponse>>  submitAssisgment(num? id, List<String> value)async {
  return courseProgressRepository!.submitAssisgment(id,value);
}

Future<Either<Failure, CommentResponse>>  getComments(String id, String type)async {
  return courseProgressRepository!.getComments(id,type);
}

Future<Either<Failure, SucessModel>>  commentsSubmitFun(String id, String comment, String type)async {
  return courseProgressRepository!.commentsSubmitFun(id,comment,type);
}







}


class GetCourseProgressParams {
final int? page;

GetCourseProgressParams({
this.page,

});
}