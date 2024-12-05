
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/BookResponse.dart';
import '../../data/models/MyBookResponse.dart';
import '../../data/models/SingleBookResponse.dart';
import '../../domain/usecase/BookStore_use_case.dart';
import 'package:flutter/material.dart';

class BookStoreController extends GetxController implements GetxService{
   final BookStoreUseCase? bookStoreUseCase;
  BookStoreController({ this.bookStoreUseCase });


   final topBookLoading=false.obs;
   final storeBookLoading=false.obs;
   final myBookLoading=false.obs;

   Rx<BookResponse?>  topBookResponse=Rx<BookResponse?>(null);
   Rx<BookResponse?>  storeBookResponse=Rx<BookResponse?>(null);
   Rx<MyBookResponse?>  mybookResponse=Rx<MyBookResponse?>(null);



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



   final sliderIndex=0.obs;
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


   Rx<SingleBookResponse?>  bookSingelResponse=Rx<SingleBookResponse?>(null);
   Future getBookDetails(String id)async {
     storeBookLoading.value=true;
     var rs= await bookStoreUseCase!.getBookDetails(id);
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
       bookSingelResponse.value=r;
       ///"pending", "start", "continue", "stop"
     });
     storeBookLoading.value=false;
   }


   Future getMyBook()async {
     myBookLoading.value=true;
     var rs= await bookStoreUseCase!.getMyBook();
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
       mybookResponse.value=r;
       ///"pending", "start", "continue", "stop"
     });
     myBookLoading.value=false;
   }

}

