import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/BookStore/data/models/BookResponse.dart';
import 'package:biddabari_new/features/BookStore/data/models/MyBookResponse.dart';
import 'package:biddabari_new/features/BookStore/data/models/SingleBookResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class BookStoreRepository {
  Future<Either<Failure, BookResponse>> getPopularBok();

  Future<Either<Failure, BookResponse>> getStoreBok();

  Future<Either<Failure, SingleBookResponse>> getBookDetails(String id);

  Future<Either<Failure, MyBookResponse>> getMyBook();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
