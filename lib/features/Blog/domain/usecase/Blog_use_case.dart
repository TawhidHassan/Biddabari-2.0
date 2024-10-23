
import 'package:biddabari_new/features/Blog/data/models/Blog/BlogResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/Blog/Blog.dart';
import '../../data/models/Blog/BlogDetailsResponse.dart';
import '../entities/Blog.dart';
import '../repositories/Blog_repository.dart';
import '../../../../core/usecase/usecase.dart';


class BlogUseCase implements UseCase<Blog, GetBlogParams> {
final BlogRepository? blogRepository;
BlogUseCase({this.blogRepository});
    @override
    Future<Either<Failure, Blog>> call(GetBlogParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }



    @override
    Future<Either<Failure, BlogResponse>>  getBlogs(int limit, String page) {
    // TODO: implement call
    return blogRepository!.getBlogs(limit,page);
    }

    @override
    Future<Either<Failure, BlogDetailsResponse>>  getBlogDetails(int id) {
    // TODO: implement call
    return blogRepository!.getBlogDetails(id);
    }



}


class GetBlogParams {
final int? page;

GetBlogParams({
this.page,

});
}