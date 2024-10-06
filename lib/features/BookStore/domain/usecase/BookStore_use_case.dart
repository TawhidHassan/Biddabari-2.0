
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/BookStore.dart';
import '../repositories/BookStore_repository.dart';
import '../../../../core/usecase/usecase.dart';


class BookStoreUseCase implements UseCase<BookStore, GetBookStoreParams> {
final BookStoreRepository? bookStoreRepository;
BookStoreUseCase({this.bookStoreRepository});
    @override
    Future<Either<Failure, BookStore>> call(GetBookStoreParams params) {
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


class GetBookStoreParams {
final int? page;

GetBookStoreParams({
this.page,

});
}