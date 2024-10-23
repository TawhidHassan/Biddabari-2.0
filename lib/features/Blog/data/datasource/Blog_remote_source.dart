import 'package:biddabari_new/features/Blog/data/models/Blog/BlogResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/Blog/BlogDetailsResponse.dart';

abstract class BlogRemoteSource {
  Future<BlogResponse?>getBlogs(int limit, String page);
  Future<BlogDetailsResponse?>getBlogDetails(int id);


}


class BlogRemoteSourceImpl implements BlogRemoteSource {
    final ApiMethod apiMethod;
   BlogRemoteSourceImpl({required this.apiMethod});

  @override
  Future<BlogResponse?> getBlogs(int limit, String page)async {
    // TODO: implement getBlogs
  try{
    final result =await apiMethod.get(url: ApiEndpoint.BLOG_LIST+"$page",showResult: true,isBasic: true,duration: 30);
    return BlogResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<BlogDetailsResponse?> getBlogDetails(int id)async {
    // TODO: implement getBlogDetails
    try{
      final result =await apiMethod.get(url: ApiEndpoint.BLOG_DETAILS+"$id",showResult: true,isBasic: true,duration: 30);
      return BlogDetailsResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
