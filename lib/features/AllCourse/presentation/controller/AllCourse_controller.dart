
import 'package:biddabari_new/features/AllCourse/data/models/course/CourseResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/AllCourseResponse.dart';
import '../../data/models/CourseCategory/CourseCategoryData.dart';
import '../../data/models/CourseCategory/CourseCategoryResponse.dart';
import '../../data/models/Student/CourseOrderResponse.dart';
import '../../data/models/course/CourseDetailsResponse.dart';
import '../../domain/usecase/AllCourse_use_case.dart';
import 'package:flutter/material.dart';

class AllCourseController extends GetxController implements GetxService{
  final AllCourseUseCase? allCourseUseCase;
  AllCourseController({ this.allCourseUseCase });

  final runningCourseLoading=false.obs;
  final popularCourseLoading=false.obs;
  final categoryCourseLoading=false.obs;
  final allCourseLoading=false.obs;
  final deatilsCourseLoading=false.obs;
  final myCourseLoading=false.obs;
  final isCurriculumSelected=true.obs;
  final selectedcategory = 0.obs;
  final selectDescription = 0.obs;
  final catetegoryList=["Courses","Mentors"].obs;
  Rx<CourseResponse?>  runingCourseResponse=Rx<CourseResponse?>(null);
  Rx<AllCourseResponse?> allCourseResponse = Rx<AllCourseResponse?>(null);

  Rx<CourseCategoryData?> courseCategoryData = Rx<CourseCategoryData?>(null);

  Rx<CourseCategoryResponse?> courseCategoryResponse = Rx<CourseCategoryResponse?>(null);
  Rx<CourseDetailsResponse?> detailsCategoryResponse = Rx<CourseDetailsResponse?>(null);
  Rx<CourseOrderResponse?> myCourseResponse = Rx<CourseOrderResponse?>(null);

  void selectCat(num? id, CourseCategoryData? courseCategoryDatax) {
    selectedcategory.value = id!.toInt();
    courseCategoryData.value = courseCategoryDatax;
    update();
  }

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
  Future getAllCourse()async {
    allCourseLoading.value=true;
    allCourseResponse.value=null;
    var rs= await allCourseUseCase!.getAllCourse();
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
      allCourseResponse.value=r;
      selectCat(0,allCourseResponse.value!.courseCategories![0]);
      ///"pending", "start", "continue", "stop"
    });
    allCourseLoading.value=false;
  }

  Future getCategoryCourse(String? slug) async{
    categoryCourseLoading.value=true;
    courseCategoryResponse.value=null;
    var rs= await allCourseUseCase!.getCategoryCourse(slug);
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
      courseCategoryResponse.value=r;

      ///"pending", "start", "continue", "stop"
    });
    categoryCourseLoading.value=false;
  }
  Future detailsCourse(String? id) async{
    deatilsCourseLoading.value=true;
    detailsCategoryResponse.value=null;
    var rs= await allCourseUseCase!.detailsCourse(id);
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
      detailsCategoryResponse.value=r;

      ///"pending", "start", "continue", "stop"
    });
    deatilsCourseLoading.value=false;
  }

  Future getMyCourse() async{
    myCourseLoading.value=true;
    myCourseResponse.value=null;
    var rs= await allCourseUseCase!.getMyCourse();
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
      myCourseResponse.value=r;

      ///"pending", "start", "continue", "stop"
    });
    myCourseLoading.value=false;
  }


  Rx<CourseCategoryResponse?>? freeServiceResponse=Rx<CourseCategoryResponse?>(null);
  Rx<CourseCategoryResponse?>? freeServiceContentResponse=Rx<CourseCategoryResponse?>(null);
 final freeLoding=false.obs;
  Future getFreeService()async {
    freeLoding.value=true;
    var rs= await allCourseUseCase!.getFreeService();
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
      freeServiceResponse!.value=r;

      ///"pending", "start", "continue", "stop"
    });
    freeLoding.value=false;
  }

  Future getFreeServiceContent(String? slug)async {
    freeLoding.value=true;
    var rs= await allCourseUseCase!.getFreeServiceContent(slug);
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
      freeServiceContentResponse!.value=r;

      ///"pending", "start", "continue", "stop"
    });
    freeLoding.value=false;
  }









}

