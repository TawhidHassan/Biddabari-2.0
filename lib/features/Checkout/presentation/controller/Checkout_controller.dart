
import 'dart:developer';

import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/LocalDataBase/localdata.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:biddabari_new/features/Exam/data/models/Exam.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/network/bkash_api.dart';
import '../../../../core/service/ssl.dart';
import '../../../../core/utils/bkash/exception.dart';
import '../../../BookStore/data/models/MyBookResponse.dart';
import '../../../Login/data/models/Auth/LoginResponse.dart';
import '../../../Login/presentation/controller/Login_controller.dart';
import '../../data/models/Coupon/CouponResponse.dart';
import '../../data/models/bkash/payment_response.dart';
import '../../data/models/bkash/payment_status.dart';
import '../../domain/usecase/Checkout_use_case.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/bkash/payment_screen.dart';


class CheckoutController extends GetxController implements GetxService{
 final CheckoutUseCase? checkoutUseCase;
  CheckoutController({ this.checkoutUseCase });



 TextEditingController mobileTextController = new TextEditingController(text: "01");
 TextEditingController mobileConfirmTextController = new TextEditingController(text: "01");
 TextEditingController coupenCodeTextController = new TextEditingController();
 TextEditingController nameTextController = new TextEditingController();
 final loginGlobalkey = GlobalKey<FormState>();
 final paymentType = "বিকাশ".obs;
 final paymentMetods = "".obs;
 final circuler = false.obs;
 final isLoading = false.obs;

 @override
  void onInit() {
    // TODO: implement onInit
    serviceLocator<DBHelper>().getUser().then((user){
      mobileTextController.text=user.get('mobile');
      mobileConfirmTextController.text=user.get('mobile');
      nameTextController.text=user.get('name');
    });
    super.onInit();
  }


 Future<LoginResponse?> login(BuildContext context,String? type,Course? course,Exam? exam,Exam? parentExam,Book? book) async{
   var localBd=serviceLocator<DBHelper>();
   // Logger().w( mobileConfirmTextController.text);
   var value = Get.find<LoginController>().loginWithoutPassword(context: context,mobile: mobileConfirmTextController.text,name: nameTextController.text).then((value) async {
     if (value!.auth_token!=null||value.error!="Mobile Number and Password does not match . Please try again.") {
       await localBd.storeTokenUserdata(deviceToken:value.user!.device_token!,id:value.user!.id.toString(),email: value.user!.email,token: value.auth_token,name: value.user!.name,
           mobile: value.user!.mobile,image: value.user!.profile_photo_url).then((valuex) async {
       });

       if(paymentType.value=="ডিজিটাল"||paymentType.value!=""){
           var trnId= DateTime.now().microsecond.toString();
           var invoiceId= DateTime.now().millisecond.toInt();
           paymentMetods.value="ssl";
           if(type=="course"){
             serviceLocator<SslConfig>().sslCommerzGeneralCall(
                 ammount:coupon.value!=null?
                 ((course!.price!-course.discount_amount!)-coupon.value!.coupon!.discountAmount!).toDouble()
                     :
                 course!.price!-course.discount_amount!.toDouble(),
                 tranId: trnId,
                 invoiceId: invoiceId,
                 id: course.id,
                 type: type,
                 context:  context,
                 coupon_code: ''
             );
           }
           else if(type=="exam"){
             serviceLocator<SslConfig>().sslCommerzGeneralCall(
                 ammount:coupon.value!=null?
                 ((exam!.price!-exam.discountAmount!)-coupon.value!.coupon!.discountAmount!).toDouble()
                     :
                 exam!.price!-exam.discountAmount!.toDouble(),
                 tranId: trnId,
                 invoiceId: invoiceId,
                 id: exam.id,
                 examId: parentExam!.id.toString(),
                 type: type,
                 context:  context,
                 coupon_code: ''
             );
           }
           else if(type=="product"){
             serviceLocator<SslConfig>().sslCommerzGeneralCall(
               book: book!,
               ammount:coupon.value!=null?
               ((double.parse(book.price??"0.0")-double.parse(book.discount_amount??"0.0"))-coupon.value!.coupon!.discountAmount!).toDouble()
                   :
               double.parse(book.price??"0.0")-double.parse(book.discount_amount??"0.0"),
                 tranId: trnId,
                 invoiceId: invoiceId,
                 type: type,
                 context: context,
             );
           }

       }
       else if(paymentType.value=="বিকাশ"){
           var trnId= DateTime.now().microsecond.toString();
           var invoiceId= DateTime.now().millisecond.toInt();
           paymentMetods.value="bkash";
           try{
             isLoading.value=true;
             PaymentResponse? result;
             if(type=="course"){
               result = await makePayment(
                 context: context,
                 amount:coupon.value!=null?
                 ((course!.price!-course!.discount_amount!)-coupon.value!.coupon!.discountAmount!).toDouble().toString()
                     :
                 (course!.price!-course!.discount_amount!.toDouble()).toString(),
                 payerReference:  ' ',
                 merchantInvoiceNumber:trnId,
               );
             }
             else if(type=="exam"){
               result = await makePayment(
                 context: context,
                 amount:coupon.value!=null?
                 ((exam!.price!-exam!.discountAmount!)-coupon.value!.coupon!.discountAmount!).toDouble().toString()
                     :
                 (exam!.price!-exam!.discountAmount!.toDouble()).toString(),
                 payerReference:  ' ',
                 merchantInvoiceNumber:trnId,
               );
             }
             else if(type=="product"){
               result = await makePayment(
                 context: context,
                 amount:coupon.value!=null?
                 ((double.parse(book!.price??"0.0")-double.parse(book.discount_amount??"0.0"))-coupon.value!.coupon!.discountAmount!).toDouble().toString()
                     :
                 (double.parse(book!.price??"0.0")-double.parse(book.discount_amount??"0.0")).toString(),
                 payerReference:  ' ',
                 merchantInvoiceNumber:trnId,
               );
             }

             isLoading.value=false;
             log(result.toString());
             if(result!.paymentId!=null||result.paymentId!=""){
               if(type=="course"){
                 orderOnelinePaymentCourse(
                     context: context,
                     type: type,
                     id:course!.id,
                     trnxId: result.trxId,
                     ammount: coupon.value!=null?
                     ((course!.price!-course!.discount_amount!)-coupon.value!.coupon!.discountAmount!).toDouble().toString()
                         :
                     (course!.price!-course!.discount_amount!.toDouble()).toString(),
                     coupon_code: ""
                 ).then((value) {
                   if (value!.success == "Payment completed successfully.") {
                     Get.snackbar(
                         "Response", value.success!,
                         backgroundColor: Colors.green,
                         colorText: Colors.white
                     );
                     context.goNamed(Routes.mainPage);
                   } else {
                     Get.snackbar(
                         "Response", value.success!, backgroundColor: Colors.green,
                         colorText: Colors.white);
                     // Get.find<HomeController>().selectedIndex.value = 4;
                   }
                 });
               }
               else if(type=="exam"){
                orderOnelinePaymentExam(context: context,
                   type: "batch_exam",id:exam!.id,Examid: parentExam!.id!.toString(),
                   trnxId: result.trxId,ammount: (exam.price!-(exam.discountAmount==null?0.0:(isCurrentTimeValid(
                      exam.discountStartDate!,exam.discountEndDate!)?exam.discountAmount:0.0))).toDouble(),)
                     .then((value) {
                   if (value!.message == "Sorry. You already enrolled this course.") {
                     context.goNamed(Routes.mainPage);
                     circuler.value=false;
                     Get.snackbar(
                         "Failed", value.message!, backgroundColor: Colors.redAccent,
                         colorText: Colors.white);
                   } else {
                     circuler.value=false;
                     Get.snackbar(
                         "Congratulation", value.success!, backgroundColor: Colors.green,
                         colorText: Colors.white);
                     // Get.find<HomeController>().selectedIndex.value = 5;
                     context.goNamed(Routes.mainPage);
                   }
                 });
               }
               else if(type=="product"){
                orderOnelinePyamnetBook(book:book,context: context,type: "product",trnxId: result.trxId).then((value){
                   if (value!.success == "Product orders submitted successfully.") {
                     Get.snackbar(
                         "Congratulation", value.success!, backgroundColor: Colors.green,
                         colorText: Colors.white);
                     // Get.find<BookController>().localDataGet?.clearCartCourse().then((value) {
                     //   // Get.find<HomeController>().selectedIndex.value = 0;
                     //   context!.goNamed(Routes.mainPage);
                     //   // grand_total.value=grand_total.value+total_vat.value.toDouble()+sub_total.value.toDouble();
                     // });
                     context.goNamed(Routes.mainPage);

                   } else {
                     Get.snackbar("Failed", value.success!, backgroundColor: Colors.redAccent, colorText: Colors.white);
                   }
                 });
               }
             }
           }on PaymentException catch (e) {
             isLoading.value=false;
             // Show error message
             // UtilsBkash.showSnackBar(message: e.message);
           } catch (e, s) {
             isLoading.value=false;
             log("Unknown exception: ", error: e, stackTrace: s);
             // UtilsBkash.showSnackBar(message: 'Something went wrong');
           }


       }

     }
     else {
       circuler.value=false;
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         behavior: SnackBarBehavior.floating,
         backgroundColor: AppColors.kPrimaryColorx,
         content: SizedBox(
           height: 20,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Failed to login",
                 style: mediumText(14.sp, color: Colors.white),),
             ],
           ),
         ),
         duration: Duration(milliseconds: 3000),
       ));
     }
   });

   return value;
 }

 bool isCurrentTimeValid(String startDateStr, String endDateStr) {
   final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
   DateTime startDate = dateFormat.parse(startDateStr);
   DateTime endDate = dateFormat.parse(endDateStr);
   DateTime currentTime = DateTime.now();

   return currentTime.isAfter(startDate) && currentTime.isBefore(endDate);
 }


 Rx<LoginResponse?> orderResponseCourse = Rx<LoginResponse?>(null);
 Future<LoginResponse?> orderOnelinePaymentCourse({BuildContext? context, String? type, num? id, String? trnxId,
   String? ammount,
   String? coupon_code,
 }) async {
   circuler.value = true;
   orderResponseCourse.value = null;
   var res=await  checkoutUseCase!.orderCourse(
     type: type,
     id: id,
     payment_method:  paymentType.value=="ডিজিটাল"?"ssl":"ssl",
     trnxId: trnxId,
     total_amount: ammount,
     coupon_code: coupon_code,
   );
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
     context!.goNamed(Routes.mainPage);
   },(onRight){
     circuler.value = false;
     orderResponseCourse.value=onRight;
   });

   return orderResponseCourse.value;
 }



 Future<LoginResponse?> orderOnelinePaymentExam({BuildContext? context, String? type, num? id,String? Examid,
   String? trnxId,
   String?ammount}) async {
   circuler.value = true;
   orderResponseCourse.value=null;

   circuler.value = true;
   orderResponseCourse.value = null;
   var res=await  checkoutUseCase!.orderExam(
     type: type,
     id: id,
     Examid: Examid,
     payment_method:  paymentType.value=="ডিজিটাল"?"ssl":"ssl",
     trnxId: trnxId,
     total_amount: ammount,
   );
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
     circuler.value = false;
     orderResponseCourse.value=onRight;
   });


   return orderResponseCourse.value;
 }


 Future<LoginResponse?> orderOnelinePyamnetBook(
     {BuildContext? context,Book?book, String? type, String? trnxId})async {
   circuler.value=true;
   orderResponseCourse.value=null;
   var res=await  checkoutUseCase!.orderBook(
       book:book,
       address: "",
       type: type,
       payment_method: paymentMetods.value,
       trnxId: trnxId,
       delivery: mybookResponse.value!.deliveryCharge!.toDouble()

   );
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
     circuler.value = false;
     orderResponseCourse.value=onRight;
   });

   return orderResponseCourse.value;
 }





 final CuponCirculer=false.obs;
 Rx<CouponResponse?> coupon = Rx<CouponResponse?>(null);
 Future applyCupon(String id) async{
   coupon.value=null;
   CuponCirculer.value = true;
   // await courseRepository!.applyCupon(id,coupenCodeTextController.text).then((value){
   //
   //   if(value.status!="false"){
   //     coupon.value=null;
   //     coupon.value=value;
   //   }else{
   //     coupon.value=null;
   //     Get.snackbar("Somethings Wrong", value.message!,backgroundColor: Colors.red,colorText: Colors.white);
   //   }
   //   CuponCirculer.value = false;
   // });

 }


 Future<PaymentResponse> makePayment({
   required String amount,
   required String payerReference,
   required String merchantInvoiceNumber,
   required BuildContext context
 }) async {
   return bkashApi.createPayment(
       amount: amount,
       payerReference: payerReference,
       merchantInvoiceNumber: merchantInvoiceNumber
   ).then((resp) async {

     if (resp.statusCode != '0000') {
       throw PaymentException(message: resp.statusMessage);
     }

     final paymentStatus = await Navigator.push<PaymentStatus>(
         context,
         MaterialPageRoute(
             builder: (_) => PaymentScreen(
               bkashURL: resp.bkashURL,
               failureCallbackURL: resp.failureCallbackURL,
               successCallbackURL: resp.successCallbackURL,
               cancelledCallbackURL: resp.cancelledCallbackURL,
             ))) ??
         PaymentStatus.canceled;
     Logger().w(paymentStatus);

     switch (paymentStatus) {
       case PaymentStatus.success:
         final result = await bkashApi.executePayment(paymentId: resp.paymentID);
         if (result.statusCode != '0000') {
           throw PaymentException(message: result.statusMessage);
         }

         return PaymentResponse(
           trxId: result.trxID,
           paymentId: result.paymentID,
           executeTime: result.paymentExecuteTime,
           payerReference: result.payerReference,
           customerMsisdn: result.customerMsisdn,
           merchantInvoiceNumber: result.merchantInvoiceNumber,
         );
       case PaymentStatus.canceled:
         throw PaymentException(message: "Payment Cancelled");
       default:
         throw PaymentException(message: "Payment Failedx");
     }
   });
 }

 Rx<MyBookResponse?> mybookResponse=Rx<MyBookResponse?>(null);
 Future getDeliveryAddress()async {
   circuler.value = true;
   var res=await  checkoutUseCase!.getDeliveryAddress();
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
     circuler.value = false;
     mybookResponse.value=onRight;
   });
 }

}

