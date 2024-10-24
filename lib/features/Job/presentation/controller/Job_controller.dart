
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/common/data/Category/Categorie.dart';
import '../../data/models/JobResponse.dart';
import '../../domain/usecase/Job_use_case.dart';
import 'package:flutter/material.dart';

class JobController extends GetxController implements GetxService{
  final JobUseCase? jobUseCase;
  JobController({ this.jobUseCase });

  final circleJob = false.obs;
  Rx<JobResponse?> jobResponse = Rx<JobResponse?>(null);
  Rx<Categorie?> selectedJobcategory = Rx<Categorie?>(null);
  final selectedJobategoryId=0.obs;
  void selectJobCat(num? id) {
    selectedJobategoryId.value=id!.toInt();
    Logger().w(id);
    if(jobResponse.value!.circulars!.where((element) => element.id==id).isEmpty){
      selectedJobcategory.value=null;
    }else{
      selectedJobcategory.value=jobResponse.value!.circulars!.where((element) => element.id==id).first;
    }
    update();
  }


  Future getJobs()async {
    circleJob.value = true;
    var rs= await jobUseCase!.getJobs();
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
      jobResponse.value=r;
      selectedJobcategory.value=r.circulars![0];
      selectedJobategoryId.value=r.circulars![0].id!.toInt();

      ///"pending", "start", "continue", "stop"
    });

    circleJob.value = false;
  }


}

