import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/LocalDataBase/localdata.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/Checkout/presentation/controller/Checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:go_router/go_router.dart';

import '../routes/route_path.dart';


class SslConfig{

  Future<void> sslCommerzGeneralCall({Book? book,String?coupon_code,String?type,num? id,double? ammount, String? tranId,int? invoiceId,BuildContext? context,  String? examId}) async {
    var tokenx = await serviceLocator<DBHelper>().getData();
    Sslcommerz? sslcommerz;

    if(type=="product"){
      // var bookListx= Get.find<BookController>().bookList!.value;
      // var deliveryCharge= Get.find<BookController>().mybookResponse.value!.deliveryCharge!.toDouble();
      // double bookTotalAmmount=0.0;
      // double bookxTotalAmmount=0.0;
      // double discountTotalAmmount=0.0;
      // for(var i=0;i<bookListx.length;i++){
      //   bookxTotalAmmount+=(bookListx[i].price!.toDouble())*bookListx[i].quantity!.toDouble();
      //   discountTotalAmmount+=(bookListx[i].discount!.toDouble())*bookListx[i].quantity!.toDouble();
      //
      // }

      // bookTotalAmmount=(bookxTotalAmmount-discountTotalAmmount)+deliveryCharge;
      // Logger().w(bookTotalAmmount);
      sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
          //Use the ipn if you have valid one, or it will fail the transaction.
          ipn_url: "https://biddabari.com",
          multi_card_name: "",
          currency: SSLCurrencyType.BDT,
          product_category: "Education",
          // sdkType:  SSLCSdkType.TESTBOX,
          sdkType:   SSLCSdkType.LIVE,
          // store_id: "learn654f12aa5010e",
          store_id: "biddabarilive",
          // store_passwd: "learn654f12aa5010e@ssl",
          store_passwd: "624D6821D9D8194897",
          total_amount: ammount!,
          tran_id: tranId!,
        ),
      ).addCustomerInfoInitializer(
          customerInfoInitializer: SSLCCustomerInfoInitializer(
              customerState: "Dhaka",
              customerName: tokenx.get('name'),
              customerEmail: "mobilepurchess@gmail.com",
              customerAddress1: "Dhaka",
              customerCity: "Dhaka",
              customerPostCode: "101",
              customerCountry: "Bangladesh",
              customerPhone: tokenx.get('mobile'))
      );
    }
    else{
      sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
          //Use the ipn if you have valid one, or it will fail the transaction.
          ipn_url: "https://biddabari.com",
          multi_card_name: "",
          currency: SSLCurrencyType.BDT,
          product_category: "Education",
          // sdkType:  SSLCSdkType.TESTBOX,
          sdkType:   SSLCSdkType.LIVE,
          // store_id: "learn654f12aa5010e",
          store_id: "biddabarilive",
          // store_passwd: "learn654f12aa5010e@ssl",
          store_passwd: "624D6821D9D8194897",
          total_amount: ammount!,
          tran_id: tranId!,
        ),
      ).addCustomerInfoInitializer(
          customerInfoInitializer: SSLCCustomerInfoInitializer(
              customerState: "Dhaka",
              customerName: tokenx.get('name'),
              customerEmail: "mobilepurchess@gmail.com",
              customerAddress1: "Dhaka",
              customerCity: "Dhaka",
              customerPostCode: "101",
              customerCountry: "Bangladesh",
              customerPhone: tokenx.get('mobile'))
      );
    }


    try {
      SSLCTransactionInfoModel result = await sslcommerz!.payNow();
      if (result.status!.toLowerCase() == "failed") {
        Fluttertoast.showToast(
          msg: "Transaction is Failed....",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.find<CheckoutController>().circuler.value=false;
        // Get.find<BookController>().circuler.value=false;

      }
      else if (result.status!.toLowerCase() == "closed") {
        Fluttertoast.showToast(
          msg: "SDK Closed by User",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.find<CheckoutController>().circuler.value=false;
        // Get.find<BookController>().circuler.value=false;
      }
      else {
        Fluttertoast.showToast(
            msg:
            "Transaction is ${result.status} and Amount is ${result.amount}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        var data = {
          "id":invoiceId,
          "bank_tran_id":result.bankTranId!,
          "card_type":result.cardType,
          "store_amount":result.amount,
          "tran_date":result.tranDate,
          "currency":"BDT",
          "status":"Complete"
        };
        Logger().w(result.currencyType,);
        // Get.find<CartController>().updateInvoice(data,context);
        // Navigator.pushNamedAndRemoveUntil(
        //   context!, MAIN_PAGE, (route) => false,);



        ///Exam Purchs
        if(type=="batch_exam"){
          Get.find<CheckoutController>().orderOnelinePaymentExam(context: context,
              type: type,id:id!,Examid: examId!,
              trnxId: result.bankTranId!,ammount: result.amount.toString()).then((value) {
            if (value!.message == "Sorry. You already enrolled this course.") {
              context!.goNamed(Routes.mainPage);
              Get.snackbar(
                  "Failed", value.message!, backgroundColor: Colors.redAccent,
                  colorText: Colors.white);
            } else {
              Get.snackbar(
                  "Congratulation", value.success!, backgroundColor: Colors.green,
                  colorText: Colors.white);

              context!.goNamed(Routes.mainPage);
            }
          });
        }
        else if(type=="course"){
          ///Course
          Get.find<CheckoutController>().orderOnelinePaymentCourse(
              context: context,
              type: type,id:id!,
              coupon_code: coupon_code,
              trnxId: result.bankTranId!,ammount: result.amount.toString()).then((value) {
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
              context!.goNamed(Routes.mainPage);
            }
          });
        }
        else if(type=="product"){

          Get.find<CheckoutController>().orderOnelinePyamnetBook(book:book,context: context,type: "product",trnxId: tranId).then((value){
            if (value!.success == "Product orders submitted successfully.") {
              Get.snackbar(
                  "Congratulation", value.success!, backgroundColor: Colors.green,
                  colorText: Colors.white);
              // Get.find<BookController>().localDataGet?.clearCartCourse().then((value) {
              //   // Get.find<HomeController>().selectedIndex.value = 0;
              //   context!.goNamed(Routes.mainPage);
              //   // grand_total.value=grand_total.value+total_vat.value.toDouble()+sub_total.value.toDouble();
              // });
              context!.goNamed(Routes.mainPage);

            } else {
              Get.snackbar("Failed", value.success!, backgroundColor: Colors.redAccent, colorText: Colors.white);
            }
          });
        }
        // Navigator.pushReplacementNamed(context!,MAIN_PAGE);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}