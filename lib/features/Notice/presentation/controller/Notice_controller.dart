
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/Notice/NoticeResponse.dart';
import '../../domain/usecase/Notice_use_case.dart';
import 'package:flutter/material.dart';

class NoticeController extends GetxController implements GetxService{
 final NoticeUseCase? noticeUseCase;
  NoticeController({ this.noticeUseCase });



 Rx<NoticeResponse?> noticeResponse = Rx<NoticeResponse?>(null);

 final noticeLoading=false.obs;



 Future getNotice() async{
  noticeLoading.value=true;
  noticeResponse.value=null;
  var rs= await noticeUseCase!.getNotice();
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
   noticeResponse.value=r;
  });
  noticeLoading.value=false;
 }

}

