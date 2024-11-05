
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/Affiliate/AffilitaeResponse.dart';
import '../../domain/usecase/Affiliation_use_case.dart';
import 'package:flutter/material.dart';

class AffiliationController extends GetxController implements GetxService{
  final AffiliationUseCase? affiliationUseCase;
  AffiliationController({ this.affiliationUseCase });

  final loading=false.obs;
  final affilitaerCreateCirculer=false.obs;
  Rx<AffilitaeResponse?>  affilitaeResponse=Rx<AffilitaeResponse?>(null);

  Future getAffiliation() async{
    loading.value=true;
    var rs= await affiliationUseCase!.getAffiliation();
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
      affilitaeResponse.value=r;
      ///"pending", "start", "continue", "stop"
    });
    loading.value=false;
  }

  Future createCode()async {
    var rs= await affiliationUseCase!.createCode();
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
      getAffiliation();
    });
    affilitaerCreateCirculer.value=true;

  }


}

