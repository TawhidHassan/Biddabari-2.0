
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/BookResponse.dart';
import '../../domain/usecase/BookStore_use_case.dart';
import 'package:flutter/material.dart';

class BookStoreController extends GetxController implements GetxService{
   final BookStoreUseCase? bookStoreUseCase;
  BookStoreController({ this.bookStoreUseCase });


   final topBookLoading=false.obs;
   final storeBookLoading=false.obs;

   Rx<BookResponse?>  topBookResponse=Rx<BookResponse?>(null);
   Rx<BookResponse?>  storeBookResponse=Rx<BookResponse?>(null);



   Future getPopularBok()async {
    topBookLoading.value=true;
    var rs= await bookStoreUseCase!.getPopularBok();
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
      topBookResponse.value=r;
      ///"pending", "start", "continue", "stop"
    });
    topBookLoading.value=false;
  }




   Future getStoreBok()async {
     storeBookLoading.value=true;
     var rs= await bookStoreUseCase!.getStoreBok();
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
       storeBookResponse.value=r;
       ///"pending", "start", "continue", "stop"
     });
     storeBookLoading.value=false;
   }


}

