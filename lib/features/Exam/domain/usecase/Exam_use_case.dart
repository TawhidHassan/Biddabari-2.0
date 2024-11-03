
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/BatchExam/BatchExamResponse.dart';
import '../../data/models/BatchExam/MyExamResponse.dart';
import '../../data/models/Exam.dart';
import '../../data/models/Question/QuestionResponse.dart';
import '../../data/models/Question/QuestionSaveResponse.dart';
import '../repositories/Exam_repository.dart';
import '../../../../core/usecase/usecase.dart';


class ExamUseCase implements UseCase<Exam, GetExamParams> {
final ExamRepository? examRepository;
ExamUseCase({this.examRepository});
    @override
    Future<Either<Failure, Exam>> call(GetExamParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

    @override
    Future<Either<Failure, BatchExamResponse>> getAllExam( ) {
    // TODO: implement call
     return examRepository!.getAllExam();
    }
    @override
    Future<Either<Failure, ExamDetailsResponse>> getExamDetails(int id ) {
    // TODO: implement call
     return examRepository!.getExamDetails(id);
    }

    @override
    Future<Either<Failure, MyExamResponse>> getMyExam( ) {
    // TODO: implement call
     return examRepository!.getMyExam();
    }

@override
Future<Either<Failure, QuestionSaveResponse>> getMyFavoraiteQuestion(String id)async {
  return examRepository!.getMyFavoraiteQuestion(id);
}

@override
Future<Either<Failure, QuestionResponse>> getExamAnswer({String? id, bool? isCourseExam, bool? isClassExam})async {
  return examRepository!.getExamAnswer(id: id,isCourseExam: isCourseExam,isClassExam: isClassExam);
}









}


class GetExamParams {
final int? page;

GetExamParams({
this.page,

});
}