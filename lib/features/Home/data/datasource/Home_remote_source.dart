import 'package:biddabari_new/core/common/data/Category/CategoryResponse.dart';
import 'package:biddabari_new/core/common/data/Slider/SliderResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class HomeRemoteSource {

Future<SliderResponse?> getSlider();
Future<CategoryResponse?> getcatgeoryList();

}


class HomeRemoteSourceImpl implements HomeRemoteSource {
    final ApiMethod apiMethod;
   HomeRemoteSourceImpl({required this.apiMethod});

  @override
  Future<SliderResponse?> getSlider()async {
    // TODO: implement getSlider
    try{
      final result =await apiMethod.get(url: ApiEndpoint.SLIDER_GET,showResult: true,isBasic: true,duration: 30);
      return SliderResponse.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CategoryResponse?> getcatgeoryList()async {
    // TODO: implement getcatgeoryList
  try{
    final result =await apiMethod.get(url: ApiEndpoint.CATEGORY_LIST_GET,showResult: true,isBasic: true,duration: 30);
    return CategoryResponse.fromJson(result!);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }


}
