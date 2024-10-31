
import 'dart:io';

import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/LocalDataBase/localdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:quiver/async.dart';
import '../../../../core/LocalDataBase/AddressLocal/AddressLocal.dart';
import '../../../../core/config/Strings/app_strings.dart';
import '../../../../core/service/hive_service.dart';
import '../../../AllCourse/data/models/course/CourseDetailsResponse.dart';
import '../../../Exam/data/models/Question/QuestionResponse.dart';
import '../../data/models/Comment/CommentResponse.dart';
import '../../domain/usecase/CourseProgress_use_case.dart';
import 'package:flutter/material.dart';

class CourseProgressController extends GetxController implements GetxService{
 final CourseProgressUseCase? courseProgressUseCase;
  CourseProgressController({ this.courseProgressUseCase });


 Rx<CourseDetailsResponse?>  courseContentDetails=Rx<CourseDetailsResponse?>(null);
 Rx<QuestionResponse?>  assigmentScriptResponse=Rx<QuestionResponse?>(null);
 Rx<QuestionResponse?>  questionResponse=Rx<QuestionResponse?>(null);

 TextEditingController commentTextController = TextEditingController();

 CountdownTimer? countDownTimer;

 final circuler=false.obs;
 final playOneline=false.obs;
 final examSubmitCirculer=false.obs;
 final downloadCirculer=false.obs;
 final dwonloadsatart=false.obs;
 final videoFullScrren=false.obs;
 final downloadProgress=0.obs;
 final downloadId="".obs;
 final examCirculer=false.obs;

 final cartList = <AddressLocal>[].obs;

 final filePath="".obs;
 final filePathList=<String>[].obs;
 final fileList=<File>[].obs;
 File? file;
 final picker = ImagePicker();

 Future<File?> filepic()async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
   filePath.value="";
   File filer = File(result.files.single.path!);
   filePath.value=result.files.single.path!;
   filePathList.add(result.files.single.path!);
   fileList.add(File(result.files.single.path!));
   file=filer;
  } else {
   // User canceled the picker
  }
 }
 Future<File?> filepicCamera()async{
  // FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

  final result=await picker.pickImage(source: ImageSource.camera);

  if (result != null) {
   filePath.value="";
   File filer = File(result.path);
   filePath.value=result.path;
   filePathList.add(result.path);
   fileList.add(File(result.path));
   file=filer;
  } else {
   // User canceled the picker
  }
 }


 void updatePrgress(int message,String id) {
  downloadProgress.value = message;
  downloadId.value = id;
  if (message == 100) {
   /*Get.snackbar(
          "Successfully Downloaded The video", "Now You Can Play This",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8));*/
   downloadCirculer.value = false;
  }
  update();
 }


 void addAddress(AddressLocal? address, {void Function()? success}) async {
  if (address != null) {
   // Store the data first
   bool isAdded = await serviceLocator<HiveService>().storeData<AddressLocal>(
    data: address,
    boxName: AppStrings.ADDRESS_BOX,
   );

   if (isAdded) {
    debugPrint("Successfully added to cart");
    // Now that it's successfully added to the box, save the product
    address.save(); // This will associate the product with the box
    fetchAddressList();
    if (success != null) {
     success();
    }
   }
  }
 }

 Future<void> fetchAddressList() async {
  await serviceLocator<HiveService>().openBox<AddressLocal>(AppStrings.ADDRESS_BOX);
  cartList.value.assignAll(Hive.box<AddressLocal>(AppStrings.ADDRESS_BOX).values.toList()); // Load initial data
 }


 Future getCourseContent(String? id) async{
  circuler.value=true;
  var rs= await courseProgressUseCase!.getCourseContent(id);
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
   courseContentDetails.value=r;
  });
  circuler.value = false;
 }

  Future getAssigmentScript(num id)async {
   circuler.value=true;
   var rs= await courseProgressUseCase!.getAssigmentScript(id);
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
    assigmentScriptResponse.value=r;
   });
   circuler.value = false;
  }

 Future getAssigmentTakenOrNot(int id) async{
  circuler.value=true;
  var rs= await courseProgressUseCase!.getAssigmentTakenOrNot(id);
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
   assigmentScriptResponse.value=r;
  });
  circuler.value = false;
 }

  Future submitAssisgment(num? id, BuildContext context)async {
   examSubmitCirculer.value=true;
   var rs= await courseProgressUseCase!.submitAssisgment(id,filePathList.value);
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
    Get.snackbar("Successfully", "Congratulation your assignment submit",backgroundColor: Colors.green);
    Navigator.pop(context);
    Navigator.pop(context);
   });
   examSubmitCirculer.value = false;

  }


 Rx<CommentResponse?> comments = Rx<CommentResponse?>(null);
 final commentCircle=false.obs;
 Future getComments(String id, String type)async {
  commentCircle.value=true;
  var rs= await courseProgressUseCase!.getComments(id,type);
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
   comments.value=r;
  });
  commentCircle.value = false;
 }

  Future commentsSubmitFun(String id, String comment, String type)async {
   commentCircle.value=true;
   var rs= await courseProgressUseCase!.commentsSubmitFun(id,comment,type);
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
    commentTextController.text="";
    Get.snackbar("Successfully", "Add comment",backgroundColor: Colors.green);
    getComments(id,type);
   });
   commentCircle.value = false;
  }

  Future getExamQuestions(String id, int hasExam, bool isCourseExam)async {
   examCirculer.value=true;
   questionResponse.value=null;
   var rs= await courseProgressUseCase!.getExamQuestions(id,hasExam,isCourseExam);
   examCirculer.value=false;
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
    questionResponse.value=r;
    if(countDownTimer!=null){
     if(countDownTimer!.isRunning){
      countDownTimer!.cancel();
     }
    }
   });

  }

}

