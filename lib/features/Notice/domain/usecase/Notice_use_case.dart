
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/Notice.dart';
import '../repositories/Notice_repository.dart';
import '../../../../core/usecase/usecase.dart';


class NoticeUseCase implements UseCase<Notice, GetNoticeParams> {
final NoticeRepository? noticeRepository;
NoticeUseCase({this.noticeRepository});
    @override
    Future<Either<Failure, Notice>> call(GetNoticeParams params) {
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


class GetNoticeParams {
final int? page;

GetNoticeParams({
this.page,

});
}