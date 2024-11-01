

import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/LocalDataBase/localdata.dart';
import 'package:biddabari_new/features/Checkout/presentation/controller/Checkout_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';



class BkashConfig{

  Future<void> bkashGeneralCall({String?type,num? id,double? ammount, String? tranId,int? invoiceId,BuildContext? context,  String? examId}) async {
    FlutterBkash? flutterBkash;
    flutterBkash = FlutterBkash(
      bkashCredentials: BkashCredentials(
        username: "01770618567",
        // username: "01896060888",
        password: "D7DaC<*E*eG",
        // password: "FjY%8ShYf@}",
        appKey: "0vWQuCRGiUX7EPVjQDr0EUAYtc",
        // appKey: "YNpYUucNwX0uxfoUa9hJ4Jf1tc",
        appSecret: "jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx",
        // appSecret: "vFqcGRRIeqqpjVe5q3PsTOEc7ttg0wqncqOWmlDSvAWAXqX3mlLb",
        isSandbox: true,
        // isSandbox: false,
      ),
    );

    if(type=="product"){
      // var bookListx= Get.find<BookController>().bookList!.value;
      // var deliveryCharge= Get.find<BookController>().mybookResponse.value!.deliveryCharge!.toDouble();
      // double bookTotalAmmount=0.0;
      // double bookxTotalAmmount=0.0;
      // double discountTotalAmmount=0.0;
      // for(var i=0;i<bookListx.length;i++){
      //   bookxTotalAmmount+=(bookListx[i].price!.toDouble())*bookListx[i].quantity!.toDouble();
      //   discountTotalAmmount+=(bookListx[i].discount!.toDouble())*bookListx[i].quantity!.toDouble();
      // }
      // bookTotalAmmount=(bookxTotalAmmount-discountTotalAmmount)+deliveryCharge;
      // // Logger().w(bookTotalAmmount);
      //
      // try{
      //   final result = await flutterBkash.pay(
      //     context: context!, // BuildContext context
      //     amount: bookTotalAmmount, // amount as double
      //     merchantInvoiceNumber: tranId!,
      //   );
      //   try {
      //     if (result.trxId ==null||result.trxId == "") {
      //       Fluttertoast.showToast(
      //         msg: "Transaction is Failed....",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 1,
      //         backgroundColor: Colors.red,
      //         textColor: Colors.white,
      //         fontSize: 16.0,
      //       );
      //     }
      //     else {
      //       if(type=="batch_exam"){
      //         Get.find<CourseController>().orderOnelinePaymentExam(context: context,
      //             type: type,id:id!,Examid: examId!,
      //             trnxId: result.trxId,ammount: ammount!.toString()).then((value) {
      //           if (value!.message == "Sorry. You already enrolled this course.") {
      //             Navigator.pushNamedAndRemoveUntil(
      //               context, MAIN_PAGE, (route) => false,);
      //             Get.snackbar(
      //                 "Failed", value.message!, backgroundColor: Colors.redAccent,
      //                 colorText: Colors.white);
      //           } else {
      //             Get.snackbar(
      //                 "Congratulation", value.success!, backgroundColor: Colors.green,
      //                 colorText: Colors.white);
      //             Get.find<HomeController>().selectedIndex.value = 5;
      //             Navigator.pushNamedAndRemoveUntil(
      //               context, MAIN_PAGE, (route) => false,);
      //           }
      //         });
      //       }
      //       else if(type=="course"){
      //         ///Course
      //         Get.find<CourseController>().orderOnelinePaymentCourse(context: context,
      //             type: type,id:id!,
      //             trnxId: result.trxId!,ammount: ammount.toString()).then((value) {
      //
      //           if (value!.success == "Payment completed successfully.") {
      //             Get.snackbar(
      //                 "Response", value.success!,
      //                 backgroundColor: Colors.green,
      //                 colorText: Colors.white
      //             );
      //             Navigator.pushNamedAndRemoveUntil(context, MAIN_PAGE, (route) => false,);
      //           } else {
      //             Get.snackbar(
      //                 "Response", value.success!, backgroundColor: Colors.green,
      //                 colorText: Colors.white);
      //             Get.find<HomeController>().selectedIndex.value = 4;
      //
      //           }
      //         });
      //       }
      //       else if(type=="product"){
      //         Get.find<BookController>().orderOnelinePyamnetBook(context: context,type: "product",trnxId: tranId).then((value){
      //           if (value!.success == "Product orders submitted successfully.") {
      //             Get.snackbar(
      //                 "Congratulation", value.success!, backgroundColor: Colors.green,
      //                 colorText: Colors.white);
      //             Get.find<BookController>().localDataGet?.clearCartCourse().then((value) {
      //               Get.find<HomeController>().selectedIndex.value = 0;
      //               Navigator.pushNamedAndRemoveUntil(
      //                 context, MAIN_PAGE, (route) => false,);
      //               // grand_total.value=grand_total.value+total_vat.value.toDouble()+sub_total.value.toDouble();
      //             });
      //
      //           } else {
      //             Get.snackbar("Failed", value.success!, backgroundColor: Colors.redAccent, colorText: Colors.white);
      //           }
      //         });
      //       }
      //       Fluttertoast.showToast(
      //           msg:
      //           "Transaction is ${result.trxId} and PaymentId is ${result.paymentId}",
      //           toastLength: Toast.LENGTH_SHORT,
      //           gravity: ToastGravity.CENTER,
      //           timeInSecForIosWeb: 1,
      //           backgroundColor: Colors.black,
      //           textColor: Colors.white,
      //           fontSize: 16.0);
      //
      //
      //       // Navigator.pushReplacementNamed(context!,MAIN_PAGE);
      //     }
      //   } catch (e) {
      //     debugPrint(e.toString());
      //   }
      //
      // }on BkashFailure catch (e, st) {
      //   /// print the error message & stackTrace
      //   Get.snackbar(
      //       "Canceled process", e.message, backgroundColor: Colors.redAccent,
      //       colorText: Colors.white);
      // }catch (e, st) {
      //   /// show the snack-bar with error message
      //   Get.snackbar(
      //       "Somethings wrong", e.toString(), backgroundColor: Colors.redAccent,
      //       colorText: Colors.white);
      // }
      //


    }

    else{
      try{
        final result = await flutterBkash.pay(
          context: context!, // BuildContext context
          amount: ammount!, // amount as double
          merchantInvoiceNumber: tranId!,
        );
        try {
          if (result.trxId ==null||result.trxId == "") {
            Fluttertoast.showToast(
              msg: "Transaction is Failed....",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          else {
            if(type=="batch_exam"){
              // Get.find<CourseController>().orderOnelinePaymentExam(context: context,
              //     type: type,id:id!,Examid: examId!,
              //     trnxId: result.trxId,ammount: ammount.toString()).then((value) {
              //   if (value!.message == "Sorry. You already enrolled this course.") {
              //     Navigator.pushNamedAndRemoveUntil(
              //       context, MAIN_PAGE, (route) => false,);
              //     Get.snackbar(
              //         "Failed", value.message!, backgroundColor: Colors.redAccent,
              //         colorText: Colors.white);
              //   } else {
              //     Get.snackbar(
              //         "Congratulation", value.success!, backgroundColor: Colors.green,
              //         colorText: Colors.white);
              //     Get.find<HomeController>().selectedIndex.value = 5;
              //     Navigator.pushNamedAndRemoveUntil(
              //       context, MAIN_PAGE, (route) => false,);
              //   }
              // });
            }
            else if(type=="course"){
              ///Course
              Get.find<CheckoutController>().orderOnelinePaymentCourse(context: context,
                  type: type,id:id!,
                  trnxId: result.trxId!,ammount: ammount.toString()).then((value) {

                if (value!.success == "Payment completed successfully.") {
                  Get.snackbar(
                      "Response", value.success!,
                      backgroundColor: Colors.green,
                      colorText: Colors.white
                  );
                  context!.goNamed(Routes.mainPage);
                } else {
                  Get.snackbar(
                      "Response", value.success!, backgroundColor: Colors.green,
                      colorText: Colors.white);
                  // Get.find<HomeController>().selectedIndex.value = 4;

                }
              });
            }
            else if(type=="product"){
              // Get.find<BookController>().orderOnelinePyamnetBook(context: context,type: "product",trnxId: tranId).then((value){
              //   if (value!.success == "Product orders submitted successfully.") {
              //     Get.snackbar(
              //         "Congratulation", value.success!, backgroundColor: Colors.green,
              //         colorText: Colors.white);
              //     Get.find<BookController>().localDataGet?.clearCartCourse().then((value) {
              //       Get.find<HomeController>().selectedIndex.value = 0;
              //       Navigator.pushNamedAndRemoveUntil(
              //         context, MAIN_PAGE, (route) => false,);
              //       // grand_total.value=grand_total.value+total_vat.value.toDouble()+sub_total.value.toDouble();
              //     });
              //
              //   } else {
              //     Get.snackbar("Failed", value.success!, backgroundColor: Colors.redAccent, colorText: Colors.white);
              //   }
              // });
            }
            Fluttertoast.showToast(
                msg:
                "Transaction is ${result.trxId} and PaymentId is ${result.paymentId}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);


            // Navigator.pushReplacementNamed(context!,MAIN_PAGE);
          }
        } catch (e) {
          debugPrint(e.toString());
        }



      }on BkashFailure catch (e, st) {
        /// print the error message & stackTrace
        Get.snackbar(
            "Cancel Process", e.message, backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }catch (e, st) {
        /// show the snack-bar with error message
        Get.snackbar(
            "Somethings wrong", e.toString(), backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }

    }



    // Logger().w(result.merchantInvoiceNumber);
    // Logger().w(result.paymentId);
    // Logger().w(result.customerMsisdn);


  }


}