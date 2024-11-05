import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/search/data/models/search_model.dart';
import 'package:fpdart/src/either.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchModel>> searchGet(String text);

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
