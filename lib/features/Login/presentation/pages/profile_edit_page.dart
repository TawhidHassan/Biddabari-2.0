import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/Login/presentation/controller/Login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/utils/system_util.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text("Profile Edit"),
      ),
      body: GetBuilder<LoginController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.circuler.value?LoadingWidget():
            SingleChildScrollView(
              child: Container(
                height: 1.0.sh,
                width: 1.0.sw,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: controller.registerFormKey,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 1.0.sw,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: AlignmentDirectional.topCenter,
                                children: [

                                  Container(
                                    height: 139,
                                    width: 1.0.sw,
                                    padding: EdgeInsets.only(bottom: 12),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x26A8A4A4),
                                          blurRadius: 15,
                                          offset: Offset(0, 8),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Mary Jones",style: boldText(21),),
                                        Text("hernandex.redial@gmail.ac.in",style: boldText(13,color: Color(0xff545454)),),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -30,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  'Name',
                                  style: boldText(14),
                                ),
                                SizedBox(height: 8,),
                                CustomTextField(
                                  textEditingController: controller.userNameController,
                                  inputFormatters: [],
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter your name";
                                    }
                                  },
                                  hintText: "Enter your name",
                                  isPrefixIcon: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Icon(Icons.person_outline),
                                  ),
                                ),
                                SizedBox(height: 16,),


                                Text(
                                  'Last Name',
                                  style: boldText(14),
                                ),
                                SizedBox(height: 8,),
                                CustomTextField(
                                  textEditingController: controller.userNameController,
                                  inputFormatters: [],
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter your name";
                                    }
                                  },
                                  hintText: "Enter your name",
                                  isPrefixIcon: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Icon(Icons.person_outline),
                                  ),
                                ),
                                SizedBox(height: 16,),


                                Text(
                                  'Date of birth',
                                  style: boldText(14),
                                ),
                                SizedBox(height: 8,),
                                CustomTextField(
                                  textEditingController: controller.userNameController,
                                  inputFormatters: [],
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter your name";
                                    }
                                  },
                                  hintText: "Enter your name",
                                  isPrefixIcon: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Icon(Icons.person_outline),
                                  ),
                                ),
                                SizedBox(height: 16,),

                                Text(
                                  'Gender',
                                  style: boldText(14),
                                ),
                                SizedBox(height: 8,),
                                CustomTextField(
                                  textEditingController: controller.userNameController,
                                  inputFormatters: [],
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter your name";
                                    }
                                  },
                                  hintText: "Enter your name",
                                  isPrefixIcon: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Icon(Icons.person_outline),
                                  ),
                                ),
                                SizedBox(height: 16,),


                                Text(
                                  'Gender',
                                  style: boldText(14),
                                ),
                                SizedBox(height: 8,),
                                CustomTextField(
                                  textEditingController: controller.userNameController,
                                  inputFormatters: [],
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter your name";
                                    }
                                  },
                                  hintText: "Enter your name",
                                  isPrefixIcon: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Icon(Icons.person_outline),
                                  ),
                                ),
                                SizedBox(height: 16,),

                                Text(
                                  'Email address',
                                  style: boldText(14),
                                ),
                                SizedBox(height: 8,),
                                CustomTextField(
                                  textEditingController: controller.userNameController,
                                  inputFormatters: [],
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter your name";
                                    }
                                  },
                                  hintText: "Enter your name",
                                  isPrefixIcon: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Icon(Icons.person_outline),
                                  ),
                                ),
                                SizedBox(height: 16,),





                                CustomElevatedButton(
                                  onPressed: () {
                                    if(controller.registerFormKey.currentState!.validate()){

                                    }
                                  },
                                  titleText: 'Update',
                                  titleSize: 14,
                                  titleColor: Colors.white,
                                  buttonColor: AppColors.primaryColor,
                                  borderRdius: 100.r,
                                  buttonMarginLeft: 52,
                                  iconRight: Container(
                                    width: 36,
                                    height: 36,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: OvalBorder(),
                                    ),
                                    child: Icon(Icons.arrow_forward_ios_sharp,
                                      color: AppColors.primaryColor,),
                                  ),
                                ),
                                SizedBox(height: 27,),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
