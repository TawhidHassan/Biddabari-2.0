
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../Dependenci Injection/init_dependencies.dart';
import '../../../../core/LocalDataBase/localdata.dart';
import '../../data/models/BatchExam/BatchExamResponse.dart';
import '../../data/models/BatchExam/ExamCategorie.dart';
import '../../data/models/BatchExam/ExamDetailsResponse.dart';
import '../../data/models/BatchExam/MyExamResponse.dart';
import '../../data/models/Exam.dart';
import '../../data/models/Question/QuestionResponse.dart';
import '../../data/models/Question/QuestionSaveResponse.dart';
import '../../domain/usecase/Exam_use_case.dart';
import 'package:flutter/material.dart';

class ExamController extends GetxController implements GetxService{
  final ExamUseCase? examUseCase;
  ExamController({ this.examUseCase });


  Rx<BatchExamResponse?> batchExamResponse = Rx<BatchExamResponse?>(null);
  Rx<ExamCategorie?> examCategorieData = Rx<ExamCategorie?>(null);
  Rx<ExamDetailsResponse?> examDetailsResponse = Rx<ExamDetailsResponse?>(null);
  Rx<MyExamResponse?> myExamReponse = Rx<MyExamResponse?>(null);
  Rx<QuestionResponse?>  questionResponse=Rx<QuestionResponse?>(null);
  Rx<QuestionSaveResponse?>  questionSaveResponse=Rx<QuestionSaveResponse?>(null);

  final saveQuesCirculer=false.obs;
  final examLoading=false.obs;
  final selectedcategory = 0.obs;
  final selectedExamcategory = 0.obs;
  final isCurriculumSelected=false.obs;
  void selectExamCat(num? id, ExamCategorie? examCategorie) {
    selectedExamcategory.value = id!.toInt();
    examCategorieData.value = examCategorie;
    update();
  }

  final selectedExamIndex= 10000.obs;
  Rx<Exam?> packageSelected = Rx<Exam?>(null);

  void selectExamPackage(int? index, Exam? exam) {
    if(index==selectedExamIndex.value){
      selectedExamIndex.value=10000;
      packageSelected.value=null;
      update();
      print("unselect");
    }else{
      selectedExamIndex.value=index!;
      packageSelected.value=exam;
      print("select");
      update();
    }


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

  Future getMyExam()async {
    examLoading.value = true;
    var rs= await examUseCase!.getMyExam();
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
      myExamReponse.value=r;

    });

    examLoading.value = false;
  }

  Future getMyFavoraiteQuestion()async {
    saveQuesCirculer.value=true;
    questionSaveResponse.value=null;
    await serviceLocator<DBHelper>().getUserId().then((onValue)async{
      var rs= await examUseCase!.getMyFavoraiteQuestion(onValue);
      saveQuesCirculer.value=false;
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
        questionSaveResponse.value=r;
      });
    });
  }


}

