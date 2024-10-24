import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryDetailsResponse.dart';
import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryResponse.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class PhotoGallaryRemoteSource {
Future<GallaryResponse?> getPhotos();
Future<GallaryDetailsResponse?> getGalleryDetails(int id);

}


class PhotoGallaryRemoteSourceImpl implements PhotoGallaryRemoteSource {
    final ApiMethod apiMethod;
   PhotoGallaryRemoteSourceImpl({required this.apiMethod});

  @override
  Future<GallaryResponse?> getPhotos()async {
    // TODO: implement getPhotos
  try{
    final result =await apiMethod.get(url: ApiEndpoint.PHOTO_GALLERY_LIST,showResult: true,isBasic: true,duration: 30);
    return GallaryResponse.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<GallaryDetailsResponse?> getGalleryDetails(int id)async {
    // TODO: implement getGalleryDetails
    try{
      final result =await apiMethod.get(url: ApiEndpoint.PHOTO_GALLERY_DETAILS+"$id",showResult: true,isBasic: true,duration: 30);
      return GallaryDetailsResponse.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }


}
