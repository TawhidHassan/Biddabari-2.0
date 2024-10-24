
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/Gallary/GallaryDetailsResponse.dart';
import '../../data/models/Gallary/GallaryResponse.dart';
import '../../domain/usecase/PhotoGallary_use_case.dart';
import 'package:flutter/material.dart';

class PhotoGallaryController extends GetxController implements GetxService{
  final PhotoGallaryUseCase? photoGallaryUseCase;
  PhotoGallaryController({ this.photoGallaryUseCase });


  Rx<GallaryResponse?> galleryResponse = Rx<GallaryResponse?>(null);
  final photoCircle = false.obs;
  Future getPhotos()async{
    photoCircle.value=true;
    galleryResponse.value=null;
    var rs= await photoGallaryUseCase!.getPhotos();
    rs.fold((l){
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }, (r){
      galleryResponse.value=r;
    });
    photoCircle.value=false;
  }

  Rx<GallaryDetailsResponse?> galleryDetailsResponse = Rx<GallaryDetailsResponse?>(null);
  Future getGalleryDetails(int? id) async{
    photoCircle.value=true;
    var rs= await photoGallaryUseCase!.getGalleryDetails(id);
    photoCircle.value=false;
    rs.fold((l){
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }, (r){
    galleryDetailsResponse.value = r;
    });
  }

}

