
import 'package:biddabari_new/features/Notice/data/models/Notice/NoticeResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/Notice/Notice.dart';
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



@override
Future<Either<Failure, NoticeResponse>> getNotice() {
// TODO: implement call
return noticeRepository!.getNotice();
}

}


class GetNoticeParams {
final int? page;

GetNoticeParams({
this.page,

});
}