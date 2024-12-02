
import 'dart:io';

import 'package:biddabari_new/core/common/data/Slider/SliderResponse.dart';
import 'package:get/get.dart';
import '../../../../Dependenci Injection/init_dependencies.dart';
import '../../../../core/LocalDataBase/localdata.dart';
import '../../../../core/common/data/Category/CategoryResponse.dart';
import '../../domain/usecase/Home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeController extends GetxController implements GetxService{
 final HomeUseCase? homeUseCase;
  HomeController({ this.homeUseCase });


  final selectedIndex=0.obs;
  final sliderIndex=0.obs;
  final categoryLoading=false.obs;
  final sliderLoading=false.obs;


 Rx<CategoryResponse?>  categoryResponse=Rx<CategoryResponse?>(null);
 Rx<SliderResponse?>  sliderResponse=Rx<SliderResponse?>(null);

 void showDialog() {
  Get.dialog(
      barrierDismissible: false,
      Dialog(
       backgroundColor: Colors.transparent,
       child: WillPopScope(
        onWillPop: () async => false,
        child: Container(
         padding: EdgeInsets.all(10),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(20)),
         child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Center(
            child: Text("No Internet Connection"),
           ),
           SizedBox(height:10,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Please check your connection again,or connect to wi-fi.",),
           ),
           Divider(
            color: Colors.grey,
            thickness: 1,
           ),

          ],
         ),
        ),
       ),
      )
  );
 }


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


 final userName="".obs;
  Future getUserData(BuildContext context)async {
   serviceLocator<DBHelper>().getUser().then((onValue){
    userName.value=onValue.get("name");
   });


  }






}

