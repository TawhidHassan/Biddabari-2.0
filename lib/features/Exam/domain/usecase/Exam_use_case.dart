
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/BatchExam/BatchExamResponse.dart';
import '../../data/models/BatchExam/MyExamResponse.dart';
import '../../data/models/Exam.dart';
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







}


class GetExamParams {
final int? page;

GetExamParams({
this.page,

});
}