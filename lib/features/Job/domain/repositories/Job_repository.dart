import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Job/data/models/JobResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class JobRepository {
  Future<Either<Failure, JobResponse>> getJobs();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
