import 'package:biddabari_new/core/error/failures.dart';
import 'package:fpdart/src/either.dart';

import '../../data/models/BatchExam/BatchExamResponse.dart';

abstract class ExamRepository {
  Future<Either<Failure, BatchExamResponse>> getAllExam();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
