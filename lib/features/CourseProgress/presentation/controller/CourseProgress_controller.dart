
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
import '../../../../core/LocalDataBase/AddressLocal/AddressLocal.dart';
import '../../../../core/config/Strings/app_strings.dart';
import '../../../../core/service/hive_service.dart';
import '../../../AllCourse/data/models/course/CourseDetailsResponse.dart';
import '../../../Exam/data/models/Question/QuestionResponse.dart';
import '../../domain/usecase/CourseProgress_use_case.dart';
import 'package:flutter/material.dart';

class CourseProgressController extends GetxController implements GetxService{
 final CourseProgressUseCase? courseProgressUseCase;
  CourseProgressController({ this.courseProgressUseCase });


 Rx<CourseDetailsResponse?>  courseContentDetails=Rx<CourseDetailsResponse?>(null);
 Rx<QuestionResponse?>  assigmentScriptResponse=Rx<QuestionResponse?>(null);

 final circuler=false.obs;
 final examSubmitCirculer=false.obs;
 final downloadCirculer=false.obs;
 final dwonloadsatart=false.obs;
 final videoFullScrren=false.obs;

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

 // Future saveAdress(String name, String number, String address) async{
 //
 //  await serviceLocator<DBHelper>().checkAddressItem(number).then((value)async{
 //   if(value.isEmpty){
 //    await serviceLocator<DBHelper>()!.addAddress(number,name,address).then((value) {
 //     print(value);
 //     if (value == "Successfully add to local") {
 //      // Get.find<CartController>().onInit();
 //
 //      update();
 //      // Get.snackbar("Successfully", "You Address Save On Device",backgroundColor: Colors.green);
 //     }
 //     else {
 //      // Get.snackbar("failed", value,backgroundColor: Colors.redAccent);
 //     }
 //    });
 //   }
 //  });
 //
 // }

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

}

