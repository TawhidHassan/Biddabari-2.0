
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../data/models/Order/Order.dart';
import '../../data/models/Order/OrderResponse.dart';
import '../../domain/usecase/More_use_case.dart';
import 'package:flutter/material.dart';

class MoreController extends GetxController implements GetxService{
 final MoreUseCase? moreUseCase;
  MoreController({ this.moreUseCase });


 Rx<OrderResponse?> orderResponse = Rx<OrderResponse?>(null);
 RxList<Order> pendingList = RxList();
 RxList<Order> confirmList = RxList();

 final orderLoading=false.obs;
 final selectFilter="Pending".obs;


 Future getMyOrder() async{
  orderLoading.value=true;
  orderResponse.value=null;
  var rs= await moreUseCase!.getMyOrder();
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
   orderResponse.value=r;
   pendingList.value = r.orders!
       .where((element) => element.status == "pending").toList();
   confirmList.value = r.orders!
       .where((element) => element.status == "approved").toList();
   ///"pending", "start", "continue", "stop"
  });
  orderLoading.value=false;
 }

}

