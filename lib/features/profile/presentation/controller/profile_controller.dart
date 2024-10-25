
import 'dart:io';
import 'package:biddabari_new/core/common/data/user/UserRresponse.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import '../../../../Dependenci Injection/init_dependencies.dart';
import '../../../../core/LocalDataBase/localdata.dart';

import '../../domain/usecase/profile_use_case.dart';
import 'package:flutter/material.dart';
class ProfileController extends GetxController implements GetxService{
 final ProfileUseCase? profileUseCase;
  ProfileController({ this.profileUseCase });

 var localBd=serviceLocator<DBHelper>();

 final fisrtname="".obs;
 final lastName="".obs;
 final name="".obs;
 final device_token="".obs;
 final number="".obs;
 final image="".obs;
 final imageUrl="".obs;

 TextEditingController emailController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
 TextEditingController userNameController = TextEditingController();
 TextEditingController fisrtNameController = TextEditingController();
 TextEditingController lastNameController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

 final filePath="".obs;
 final selectGender = "".obs;
 final selectDob = "".obs;
 File? file;
 final profileFormKey = GlobalKey<FormState>();


 @override
 void onInit() {
  getToken();
  fisrtname.value="";
  lastName.value="";
  name.value="";
  number.value="";
  image.value="";
  filePath.value="";
  imageUrl.value="";
  selectGender.value="";
  selectDob.value="";

  super.onInit();
 }

 Future<File?> filepic()async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
   filePath.value="";
   File filer = File(result.files.single.path!);
   filePath.value=result.files.single.path!;
   file=File(filePath.value);
  } else {
   // User canceled the picker
  }
 }


 void getToken() async {
  var tokenx = await serviceLocator<DBHelper>().getData();
  if (tokenx.get('deviceToken') != null) {
   device_token.value = tokenx.get('deviceToken');
   Logger().e(tokenx.get('deviceToken'));
  } else {
   device_token.value = "";
   Logger().e(tokenx.get('deviceToken'));
  }
 }


 Rx<UserRresponse?>  profileResponse=Rx<UserRresponse?>(null);


 final circuler=false.obs;
 Future<UserRresponse?> getProfile(BuildContext context,bool?isCheckout)  async{
  circuler.value=true;
  var res=await profileUseCase!.getProfile();
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
   profileResponse.value=r;
   emailController.text=r.student!.email??"";
   mobileController.text=r.student!.mobile??"";
   userNameController.text=r.user!.name??"";
   fisrtNameController.text=r.student!.firstName??"";
   lastNameController.text=r.student!.lastName??"";
   selectGender.value=r.student!.gender??"";
   selectDob.value=r.student!.dob??"";
   await localBd.UserUpdata(
       email: r.user!.email,name: r.user!.name,
       mobile: r.user!.mobile
   );
   if(isCheckout!){

   }else{
    device_token.value!=r.user!.device_token?
    _showMyDialog(context) :SizedBox();
   }
  });
  circuler.value=false;
  return profileResponse.value;
 }

 Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
   context: context,
   barrierDismissible: false, // user must tap button!
   builder: (BuildContext context) {
    return WillPopScope(
     onWillPop: () async => false,
     child: AlertDialog(
      content: SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
         decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
           Radius.circular(20),
          ),
         ),
         child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
           children: [
            const SizedBox(height: 10),
            const Text(
             "Warning",
             textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
             "Your Account are login another device,\n Please login again",
             textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            //Buttons
            Row(
             children: [
              Expanded(
               child: ElevatedButton(
                child: const Text(
                 'Login',
                ),
                style: ElevatedButton.styleFrom(
                 minimumSize: const Size(0, 45),
                 // primary: Colors.amber,
                 // onPrimary: const Color(0xFFFFFFFF),
                 // backgroundColor: Colors.amber,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                 ),
                ),
                onPressed: () async {
                 Logger().w(device_token.value);
                 var users = await Hive.openBox('users');
                 users.clear().then((value) {});
                 context.pushNamed(Routes.loginPage);
                },
               ),
              ),
             ],
            ),
           ],
          ),
         ),
        ),
       ),
      ),
      actions: <Widget>[

      ],
     ),
    );
   },
  );
 }



 Future updateUser({required BuildContext context})async {
  circuler.value=true;
  var res= await profileUseCase?.updateUser(
      iamge: file,
      userName:userNameController.text,
      firstName:userNameController.text,
      lastName:lastNameController.text,
      email:emailController.text,
      mobile:mobileController.text,
      selectGender:selectGender.value,
      selectDob:selectDob.value
   );

    res!.fold((onLeft){
     Fluttertoast.showToast(
         msg: onLeft.message,
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 2,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );
     circuler.value=false;
    },(onRight){
     getProfile(context,false);
     Fluttertoast.showToast(
         msg: "Update your profile",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 2,
         backgroundColor: Colors.green,
         textColor: Colors.white,
         fontSize: 16.0
     );
    });
 }


}

