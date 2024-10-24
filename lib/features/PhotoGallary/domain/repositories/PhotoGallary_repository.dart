import 'package:biddabari_new/core/error/failures.dart';
import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryDetailsResponse.dart';
import 'package:biddabari_new/features/PhotoGallary/data/models/Gallary/GallaryResponse.dart';
import 'package:fpdart/src/either.dart';

abstract class PhotoGallaryRepository {
  Future<Either<Failure, GallaryResponse>> getPhotos();

  Future<Either<Failure, GallaryDetailsResponse>> getGalleryDetails(int? id);

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
