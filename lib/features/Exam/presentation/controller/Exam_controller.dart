
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/BatchExam/BatchExamResponse.dart';
import '../../data/models/BatchExam/ExamCategorie.dart';
import '../../data/models/BatchExam/ExamDetailsResponse.dart';
import '../../domain/usecase/Exam_use_case.dart';
import 'package:flutter/material.dart';

class ExamController extends GetxController implements GetxService{
  final ExamUseCase? examUseCase;
  ExamController({ this.examUseCase });


  Rx<BatchExamResponse?> batchExamResponse = Rx<BatchExamResponse?>(null);
  Rx<ExamCategorie?> examCategorieData = Rx<ExamCategorie?>(null);
  Rx<ExamDetailsResponse?> examDetailsResponse = Rx<ExamDetailsResponse?>(null);

  final examLoading=false.obs;
  final selectedcategory = 0.obs;
  final selectedExamcategory = 0.obs;

  void selectExamCat(num? id, ExamCategorie? examCategorie) {
    selectedExamcategory.value = id!.toInt();
    examCategorieData.value = examCategorie;
    update();
  }


  Future getAllExam()async {
    examLoading.value = true;
    var rs= await examUseCase!.getAllExam();
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
      batchExamResponse.value=r;
      batchExamResponse.value!.examCategories!.insert(
          0, ExamCategorie(name: "All", id: 0));
      selectedExamcategory.value=0;
    });

    examLoading.value = false;
  }


  Future getExamDetails(int id)async {
    examLoading.value = true;
    var rs= await examUseCase!.getExamDetails(id);
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
      examDetailsResponse.value=r;

    });

    examLoading.value = false;
  }


}

