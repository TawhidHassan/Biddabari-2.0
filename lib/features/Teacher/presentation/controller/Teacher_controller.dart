
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/common/data/user/User.dart';
import '../../data/models/Teacher/TeacherResponse.dart';
import '../../domain/usecase/Teacher_use_case.dart';
import 'package:flutter/material.dart';


class TeacherController extends GetxController implements GetxService{
  final TeacherUseCase? teacherUseCase;
  TeacherController({ this.teacherUseCase });


  /// AlL Teacher Get with Pagination


  final teacherCircle = false.obs;
  List<User> teacherList = [];

  Rx<TeacherResponse?> teacherResponse = Rx<TeacherResponse?>(null);
  ScrollController controllerTeacher = ScrollController();
  int teacherListLength = 10;
  int teacherPage = 1;
  final teacherPagingCirculer = false.obs;


  addTeacherItems() async {
    controllerTeacher.addListener(() {
      if (controllerTeacher.position.maxScrollExtent == controllerTeacher.position.pixels) {
        teacherListLength++;
        teacherPage++;
        getTeacherPagingData(page: teacherPage.toString());
        update();
      }
    });
  }

  Future getAllTeacher({String? idx, String? pagex}) async {
    teacherCircle.value = true;
    teacherList.clear();
    teacherPage = 1;
    addTeacherItems();

    var rs=await teacherUseCase!.getAllTeacher(
     limit: 20,
     page: pagex ?? '1',
    );
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
      teacherResponse.value = r;
      for (var i = 0; i < r.teachers!.data!.length; i++) {
        teacherList.add(r.teachers!.data![i]);

      }
      update();
      Logger().e(teacherList.length);
    });
    teacherCircle.value = false;

  }


  getTeacherPagingData({String? page}) async {
    teacherPagingCirculer.value = true;
    var rs=await teacherUseCase!.getAllTeacher(
      limit: 20,
      page: page ?? '1',
    );

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

      for (var i = 0; i < r.teachers!.data!.length; i++) {
        teacherList.add(r.teachers!.data![i]);

      }
      update();

    });
    teacherPagingCirculer.value = false;
    teacherCircle.value = false;
  }



///================================


}

