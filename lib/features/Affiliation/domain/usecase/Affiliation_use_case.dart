
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/Affiliate/AffilitaeResponse.dart';
import '../entities/Affiliation.dart';
import '../repositories/Affiliation_repository.dart';
import '../../../../core/usecase/usecase.dart';


class AffiliationUseCase implements UseCase<Affiliation, GetAffiliationParams> {
final AffiliationRepository? affiliationRepository;
AffiliationUseCase({this.affiliationRepository});
    @override
    Future<Either<Failure, Affiliation>> call(GetAffiliationParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }




  @override
  Future<Either<Failure, AffilitaeResponse>> getAffiliation() {
  // TODO: implement call
  return affiliationRepository!.getAffiliation();
  }

  @override
  Future<Either<Failure, AffilitaeResponse>> createCode() {
  // TODO: implement call
  return affiliationRepository!.createCode();
  }

}


class GetAffiliationParams {
final int? page;

GetAffiliationParams({
this.page,

});
}