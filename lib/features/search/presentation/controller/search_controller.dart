
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/search_model.dart';
import '../../domain/usecase/search_use_case.dart';
import 'package:flutter/material.dart';

class SearchControllerX extends GetxController implements GetxService{
  final SearchUseCase? searchUseCase;
  SearchControllerX({ this.searchUseCase });

  final circle=false.obs;
  List<String>category=["Course","Product","Exam"];
  final selectCat="Course".obs;
  TextEditingController searchTextControlletr = TextEditingController();
  Rx<SearchModel?> response=Rx<SearchModel?>(null);

  Future searchGet()async{
    circle.value=true;
    var res=await searchUseCase!.searchGet(searchTextControlletr.text,);
    res.fold((onLeft){
      Fluttertoast.showToast(
          msg: onLeft.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    },(onRight){
      // otpResponse.value=onRight;
      Fluttertoast.showToast(
          msg: "Otp match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // context.pushNamed(Routes.setPasswordPage);
    });
    circle.value=false;
  }

}

