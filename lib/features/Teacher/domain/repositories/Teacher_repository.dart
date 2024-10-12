import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Teacher/data/models/Teacher/TeacherResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class TeacherRepository {
  Future<Either<Failure, TeacherResponse>> getAllTeacher({required int limit, required String page});

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
