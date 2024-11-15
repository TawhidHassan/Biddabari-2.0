
import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/Checkout/presentation/controller/Checkout_controller.dart';
import 'package:biddabari_new/features/Login/data/models/Auth/LoginResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import '../../../../core/Data/Location/location/location_model.dart';
import '../../../../core/LocalDataBase/localdata.dart';
import '../../../../core/routes/route_path.dart';
import '../../../ClassRoom/presentation/controller/ClassRoom_controller.dart';
import '../../../Home/presentation/controller/Home_controller.dart';
import '../../../profile/presentation/controller/profile_controller.dart';
import '../../data/models/Auth/ForgetPasswordResponse.dart';
import '../../data/models/Auth/OtpResponse.dart';
import '../../domain/usecase/Login_use_case.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';


class LoginController extends GetxController implements GetxService{
  final LoginUseCase? loginUseCase;
  LoginController({ this.loginUseCase });


  var localBd=serviceLocator<DBHelper>();
  final circuler=false.obs;
  final isCheck=false.obs;
  final tokenReseting=false.obs;
  final updateCirculer=false.obs;

  final currentTime=0.obs;
  final count = 0.obs;
  final otpText = "".obs;

  CountdownTimer? countDownTimer;

  final formKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final newPassFormKey = GlobalKey<FormState>();
  final changePassFormKey = GlobalKey<FormState>();
  final forgetFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(text: "01");
  TextEditingController mobileController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  ///otp get
  Rx<OtpResponse?>  otpResponse=Rx<OtpResponse?>(null);
  Rx<LoginResponse?>  loginResponse=Rx<LoginResponse?>(null);
  Rx<ForgetPasswordResponse?>  forgetResponse=Rx<ForgetPasswordResponse?>(null);
  ///Start Timer

  void startTimer(int _start) {
    var startx=Duration(minutes: _start).inSeconds;
    if(countDownTimer!=null){
      countDownTimer!.cancel();
      countDownTimer =  CountdownTimer(
        Duration(seconds: startx),
        Duration(seconds: 1),
      );
      var sub = countDownTimer!.listen(null);
      sub.onData((duration) {
        currentTime.value = startx - duration.elapsed.inSeconds;
        // print(currentTime);
      });
      sub.onDone(() {
        sub.cancel();
        ///

      });
    }else{
      countDownTimer =  CountdownTimer(
        Duration(seconds: startx),
        Duration(seconds: 1),
      );
      var sub = countDownTimer!.listen(null);
      sub.onData((duration) {
        currentTime.value = startx - duration.elapsed.inSeconds;
        // print(currentTime);
      });
      sub.onDone(() {
        sub.cancel();
        ///

      });
    }

  }

  increment() {
    count.value++;
  }
  final fisrtname="".obs;
  final lastName="".obs;
  final name="".obs;
  final number="".obs;


  @override
  void onInit() {

    fisrtname.value="";
    lastName.value="";
    name.value="";
    number.value="";
    super.onInit();
  }




  ///otp get

  Future<OtpResponse?> otpGet(BuildContext context)  async{
      circuler.value=true;
      var res=await loginUseCase!.otpGet(emailController.text);
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
        otpResponse.value=onRight;

        if(onRight.user_status=="exist"){
          context.pushNamed(Routes.loginPasswordPage);
          // Navigator.pushNamed(context, LOGIN_PASSWORD_PAGE,arguments: {
          //   "mobile":mobileTextController.text
          // });
        }else{
          context.pushNamed(Routes.otpPage);
          // Navigator.pushNamed(context, OTP_PAGE, arguments: {
          //   'mobile': mobileTextController.text,
          //   'otp':value.otp.toString()
          // });
        }


      });
    circuler.value=false;
    return otpResponse.value;
  }


  Future<OtpResponse?> otpMtch(BuildContext context)  async{
      circuler.value=true;
      var res=await loginUseCase!.otpMtch(emailController.text,otpText.value);
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
        otpResponse.value=onRight;
        Fluttertoast.showToast(
            msg: "Otp match",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        context.pushNamed(Routes.setPasswordPage);
      });
    circuler.value=false;
    return otpResponse.value;
  }


  Future<LoginResponse?> login(BuildContext contex)  async{
    circuler.value=true;
    var res=await loginUseCase!.login(mobile: emailController.text,password:passwordController.text,name: "");
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
    },(r) async {
     loginResponse.value=r;
     await localBd.storeTokenUserdata(
         deviceToken:r.user!.device_token!,id:r.user!.id.toString(),email: r.user!.email,token: r.auth_token,name: r.user!.name,
         mobile: r.user!.mobile,image: r.user!.profile_photo_url
     );

     Fluttertoast.showToast(
         msg: "Login Successfully",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 2,
         backgroundColor: Colors.green,
         textColor: Colors.white,
         fontSize: 16.0
     );
     Get.find<ProfileController>().getProfile(contex,false);
     Get.find<ClassRoomController>().getMyCourse();
     Get.find<HomeController>().getUserData(contex);
     contex.goNamed(Routes.mainPage);

    });
    circuler.value=false;
    return loginResponse.value;
  }

  Future<LoginResponse?>loginWithoutPassword({BuildContext? context,String? mobile,  String? password, String? name})async {
    circuler.value=true;
    var res=await loginUseCase!.login(mobile: mobile,password:"",name: name);
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
      Get.find<CheckoutController>().circuler.value=false;
    },(r) async {
      loginResponse.value=r;
      await localBd.storeTokenUserdata(
          deviceToken:r.user!.device_token!,id:r.user!.id.toString(),email: r.user!.email,token: r.auth_token,name: r.user!.name,
          mobile: r.user!.mobile,image: r.user!.profile_photo_url
      );


      Get.find<ProfileController>().getProfile(context!,true);
      Get.find<HomeController>().getUserData(context);

    });
    circuler.value=false;
    return loginResponse.value;
  }


  Future<LoginResponse?> signUp(BuildContext context)  async{
    circuler.value=true;
    var res=await loginUseCase!.signUp(mobile: emailController.text,password:passwordController.text,name: userNameController.text);
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
    },(r)async{
      loginResponse.value=r;
      await localBd.storeTokenUserdata(
          deviceToken:r.user!.device_token!,id:r.user!.id.toString(),email: r.user!.email,token: r.auth_token,name: r.user!.name,
          mobile: r.user!.mobile,image: r.user!.profile_photo_url
      );

      Fluttertoast.showToast(
          msg: "Login Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Get.find<ProfileController>().getProfile(context,false);
      Get.find<ClassRoomController>().getMyCourse();
      Get.find<HomeController>().getUserData(context);
      context.goNamed(Routes.mainPage);

    });
    circuler.value=false;
    return loginResponse.value;
  }



  Future<ForgetPasswordResponse?> resetPassword(BuildContext context)  async{
    circuler.value=true;
    var res=await loginUseCase!.resetPassword(mobile: emailController.text);
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
      forgetResponse.value=onRight;
      Fluttertoast.showToast(
          msg: "Reset OTP sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      context.pushNamed(Routes.newPasswordPage);
    });
    circuler.value=false;
    return forgetResponse.value;
  }

  Future<ForgetPasswordResponse?> passwordChange(BuildContext context)  async{
    circuler.value=true;
    var res=await loginUseCase!.passwordChange(datax: forgetResponse.value,newPassword:passwordController.text,otp:otpController.text);
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
      // forgetResponse.value=onRight;
      Fluttertoast.showToast(
          msg:onRight.message??'',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      context.pop();
      context.pop();
    });
    circuler.value=false;
    return forgetResponse.value;
  }

}

