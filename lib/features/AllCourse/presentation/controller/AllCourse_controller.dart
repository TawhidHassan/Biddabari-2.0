
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../domain/usecase/AllCourse_use_case.dart';
import 'package:flutter/material.dart';

class AllCourseController extends GetxController implements GetxService{
  final AllCourseUseCase? allCourseUseCase;
  AllCourseController({ this.allCourseUseCase });

  final runningCourseLoading=false.obs;
  final popularCourseLoading=false.obs;

  Rx<CourseResponse?>  runingCourseResponse=Rx<CourseResponse?>(null);

  Future getRuningCourse()async {
    runningCourseLoading.value=true;
    runingCourseResponse.value=null;
    var rs= await allCourseUseCase!.getRuningCourse();
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
      runingCourseResponse.value=r;
      ///"pending", "start", "continue", "stop"
    });
    runningCourseLoading.value=false;
  }

}

