
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../Dependenci Injection/init_dependencies.dart';
import '../../../../core/LocalDataBase/localdata.dart';
import '../../data/models/BatchExam/BatchExamResponse.dart';
import '../../data/models/BatchExam/ExamCategorie.dart';
import '../../data/models/BatchExam/ExamDetailsResponse.dart';
import '../../data/models/BatchExam/MyExamResponse.dart';
import '../../data/models/Exam.dart';
import '../../data/models/ExamResponse.dart';
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
  Rx<MyExamResponse?> myExamSectionReponse = Rx<MyExamResponse?>(null);
  Rx<MyExamResponse?> masterExamReponse = Rx<MyExamResponse?>(null);


  final saveQuesCirculer=false.obs;
  final examLoading=false.obs;
  final selectedcategory = 0.obs;
  final selectedExamcategory = 0.obs;
  final isCurriculumSelected=false.obs;
  final circuler=false.obs;
  void selectExamCat(num? id, ExamCategorie? examCategorie) {
    selectedExamcategory.value = id!.toInt();
    examCategorieData.value = examCategorie;
    update();
  }

  final selectedExamIndex= 10000.obs;
  Rx<Exam?> packageSelected = Rx<Exam?>(null);

  void selectExamPackage(int? index, Exam? exam) {

      selectedExamIndex.value=index!;
      packageSelected.value=exam;
      print("select");
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
      selectExamPackage(0,r.exam!.batchExamSubscriptions![0]);

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

  final rankingCirculer=false.obs;
  Rx<ExamResponse?>  examResponse=Rx<ExamResponse?>(null);
  Future getCourseExamRanking(String? id, bool? isCourseExam) async{
    rankingCirculer.value=true;
    var rs= await examUseCase!.getCourseExamRanking(id,isCourseExam);
    rankingCirculer.value=false;
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
      examResponse.value=r;
    });



  }


  Future getMyExamSection(int? id) async{
    circuler.value = true;
    var rs= await examUseCase!.getMyExamSection(id!);
    circuler.value = false;
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
      myExamSectionReponse.value=r;
    });

  }

  Future getMasterExam(int? id) async{
    circuler.value = true;
    var rs= await examUseCase!.getMasterExam(id!);
    circuler.value = false;
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
      masterExamReponse.value=r;
    });

  }

}

