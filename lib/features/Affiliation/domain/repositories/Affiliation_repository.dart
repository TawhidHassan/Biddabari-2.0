import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Affiliation/data/models/Affiliate/AffilitaeResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class AffiliationRepository {
  Future<Either<Failure, AffilitaeResponse>> getAffiliation();

  Future<Either<Failure, AffilitaeResponse>> createCode();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
