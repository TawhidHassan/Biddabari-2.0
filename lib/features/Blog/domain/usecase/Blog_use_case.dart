
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
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

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetBlogParams {
final int? page;

GetBlogParams({
this.page,

});
}