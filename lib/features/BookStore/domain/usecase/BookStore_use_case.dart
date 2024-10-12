
import 'package:biddabari_new/features/BookStore/data/models/BookResponse.dart';
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



  @override
  Future<Either<Failure, BookResponse>> getPopularBok() {
  // TODO: implement call
  return bookStoreRepository!.getPopularBok();
  }

  @override
  Future<Either<Failure, BookResponse>> getStoreBok() {
  // TODO: implement call
  return bookStoreRepository!.getStoreBok();
  }


}


class GetBookStoreParams {
final int? page;

GetBookStoreParams({
this.page,

});
}