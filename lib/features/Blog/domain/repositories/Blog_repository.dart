import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/Blog/data/models/Blog/BlogResponse.dart';
import 'package:fpdart/src/either.dart';

import '../../data/models/Blog/BlogDetailsResponse.dart';

abstract class BlogRepository {
  Future<Either<Failure, BlogResponse>> getBlogs(int limit, String page);

  Future<Either<Failure, BlogDetailsResponse>> getBlogDetails(int id);

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
