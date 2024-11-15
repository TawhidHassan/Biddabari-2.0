
import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/LocalDataBase/localdata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../AllCourse/data/models/Student/CourseOrderResponse.dart';
import '../../../AllCourse/data/models/courseSectionContent/CourseSectionContentResponse.dart';
import '../../../Exam/data/models/TodayExamResponse.dart';
import '../../domain/usecase/ClassRoom_use_case.dart';
import 'package:flutter/material.dart';


class ClassRoomController extends GetxController implements GetxService{
  final ClassRoomUseCase? classRoomUseCase;
  ClassRoomController({ this.classRoomUseCase });


  final  tabIndex = 0.obs;

  Rx<CourseOrderResponse?> courseMyResponse = Rx<CourseOrderResponse?>(null);
  Rx<CourseSectionContentResponse?> myClassResponse = Rx<CourseSectionContentResponse?>(null);
  Rx<TodayExamResponse?> todayExamResponse = Rx<TodayExamResponse?>(null);
  final todatexamCirculer = false.obs;
  final myClassCourseLoading=false.obs;
  final myClassLoading=false.obs;
  final myClassExamLoading=false.obs;
  final token="".obs;
  Future getMyCourse() async {
    serviceLocator<DBHelper>().getToken().then((onValue){
      token.value=onValue??'';
    });
    myClassCourseLoading.value = true;
    var rs= await classRoomUseCase!.getMyCourse();
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
      courseMyResponse.value=r;
      ///"pending", "start", "continue", "stop"
    });
    myClassCourseLoading.value=false;
  }


  void onTapTab(int index) {
    tabIndex.value=index;
    if(index==0){
     getMyCourse();
    }if(index==1){
      getMyClass();
    }if(index==2){
     getTodayExam();
    }
    print(tabIndex.value);
  }

  Future getMyClass() async {
    myClassLoading.value = true;
    var rs= await classRoomUseCase!.getMyClass();
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
      myClassResponse.value=r;
    });
    myClassLoading.value=false;
  }


  Future getTodayExam() async {
    myClassExamLoading.value = true;
    var rs= await classRoomUseCase!.getTodayExam();
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
      todayExamResponse.value=r;
    });
    myClassExamLoading.value=false;
  }


}

