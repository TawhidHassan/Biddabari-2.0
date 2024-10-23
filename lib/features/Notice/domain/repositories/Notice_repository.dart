import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Notice/data/models/Notice/NoticeResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class NoticeRepository {
  Future<Either<Failure, NoticeResponse>> getNotice();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
