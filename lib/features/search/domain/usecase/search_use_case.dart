
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/search_model.dart';
import '../entities/search.dart';
import '../repositories/search_repository.dart';
import '../../../../core/usecase/usecase.dart';


class SearchUseCase implements UseCase<Search, GetSearchParams> {
final SearchRepository? searchRepository;
SearchUseCase({this.searchRepository});
    @override
    Future<Either<Failure, Search>> call(GetSearchParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }




@override
Future<Either<Failure, SearchModel>> searchGet(String text) {
// TODO: implement call
return searchRepository!.searchGet(text);
}

}


class GetSearchParams {
final int? page;

GetSearchParams({
this.page,

});
}