
import 'package:biddabari_new/features/Job/data/models/job_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../repositories/Job_repository.dart';
import '../../../../core/usecase/usecase.dart';


class JobUseCase implements UseCase<JobModel, GetJobParams> {
final JobRepository? jobRepository;
JobUseCase({this.jobRepository});
    @override
    Future<Either<Failure, JobModel>> call(GetJobParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetJobParams {
final int? page;

GetJobParams({
this.page,

});
}