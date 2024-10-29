import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';
import 'package:fpdart/src/either.dart';

import '../../data/models/BatchExam/BatchExamResponse.dart';

abstract class ExamRepository {
  Future<Either<Failure, BatchExamResponse>> getAllExam();

  Future<Either<Failure, ExamDetailsResponse>> getExamDetails(int id);

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
