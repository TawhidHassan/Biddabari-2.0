import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Exam/data/models/BatchExam/ExamDetailsResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionResponse.dart';
import 'package:biddabari_new/features/Exam/data/models/Question/QuestionSaveResponse.dart';
import 'package:fpdart/src/either.dart';

import '../../data/models/BatchExam/BatchExamResponse.dart';
import '../../data/models/BatchExam/MyExamResponse.dart';

abstract class ExamRepository {
  Future<Either<Failure, BatchExamResponse>> getAllExam();

  Future<Either<Failure, ExamDetailsResponse>> getExamDetails(int id);

  Future<Either<Failure, MyExamResponse>> getMyExam();

  Future<Either<Failure, QuestionSaveResponse>> getMyFavoraiteQuestion(String id);

  Future<Either<Failure, QuestionResponse>> getExamAnswer({String? id, bool? isCourseExam, bool? isClassExam});

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
