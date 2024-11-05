import 'package:biddabari_new/features/search/data/models/search_model.dart';
import 'package:biddabari_new/features/search/domain/entities/search.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class SearchRemoteSource {

Future<SearchModel?> searchGet(String text);

}


class SearchRemoteSourceImpl implements SearchRemoteSource {
    final ApiMethod apiMethod;
   SearchRemoteSourceImpl({required this.apiMethod});

  @override
  Future<SearchModel?> searchGet(String text) async{
    // TODO: implement searchGet
    Map<String, dynamic> data = {
    "search_content":text,
    };
    try{
      final result =await apiMethod.post(url: ApiEndpoint.SEARCH_ALL,body: data,showResult: true,isBasic: true,duration: 30);
      return SearchModel.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

// @override
// Future<LoginResponseModel?> login(String email,String deviceToken, String pass, bool isPg)async {
//

// }
}
