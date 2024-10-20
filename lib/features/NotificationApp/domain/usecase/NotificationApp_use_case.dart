
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/NotificationApp.dart';
import '../repositories/NotificationApp_repository.dart';
import '../../../../core/usecase/usecase.dart';


class NotificationAppUseCase implements UseCase<NotificationApp, GetNotificationAppParams> {
final NotificationAppRepository? notificationAppRepository;
NotificationAppUseCase({this.notificationAppRepository});
    @override
    Future<Either<Failure, NotificationApp>> call(GetNotificationAppParams params) {
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


class GetNotificationAppParams {
final int? page;

GetNotificationAppParams({
this.page,

});
}