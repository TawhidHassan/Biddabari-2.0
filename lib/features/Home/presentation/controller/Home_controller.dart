
import 'package:biddabari_new/core/common/data/Slider/SliderResponse.dart';
import 'package:get/get.dart';
import '../../../../core/common/data/Category/CategoryResponse.dart';
import '../../domain/usecase/Home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeController extends GetxController implements GetxService{
 final HomeUseCase? homeUseCase;
  HomeController({ this.homeUseCase });


  final categoryLoading=false.obs;
  final sliderLoading=false.obs;


 Rx<CategoryResponse?>  categoryResponse=Rx<CategoryResponse?>(null);
 Rx<SliderResponse?>  sliderResponse=Rx<SliderResponse?>(null);

  Future getcatgeoryList()async {
   categoryLoading.value=true;
   var rs= await homeUseCase!.getcatgeoryList();
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
    categoryResponse.value=r;
    ///"pending", "start", "continue", "stop"
   });
   categoryLoading.value=false;
  }
  Future getSlider()async {
   sliderLoading.value=true;
   sliderResponse.value=null;
   var rs= await homeUseCase!.getSlider();
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
    sliderResponse.value=r;
   });
   sliderLoading.value=false;
  }



}

