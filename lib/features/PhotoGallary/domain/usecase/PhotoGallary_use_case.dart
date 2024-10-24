
import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryDetailsResponse.dart';
import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/PhotoGallary.dart';
import '../repositories/PhotoGallary_repository.dart';
import '../../../../core/usecase/usecase.dart';


class PhotoGallaryUseCase implements UseCase<PhotoGallary, GetPhotoGallaryParams> {
final PhotoGallaryRepository? photoGallaryRepository;
PhotoGallaryUseCase({this.photoGallaryRepository});
    @override
    Future<Either<Failure, PhotoGallary>> call(GetPhotoGallaryParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }


  @override
  Future<Either<Failure, GallaryResponse>> getPhotos() {
  // TODO: implement call
  return photoGallaryRepository!.getPhotos();
  }
  @override
  Future<Either<Failure, GallaryDetailsResponse>> getGalleryDetails(int? id) {
  // TODO: implement call
  return photoGallaryRepository!.getGalleryDetails(id);
  }



}


class GetPhotoGallaryParams {
final int? page;

GetPhotoGallaryParams({
this.page,

});
}