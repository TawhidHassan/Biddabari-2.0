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

class SetNewPasswordPage extends StatelessWidget {
  const SetNewPasswordPage({super.key});

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
      ),
      body: GetBuilder<LoginController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: controller.newPassFormKey,
                    child: Column(
                      children: [
                        Text(
                          'Set New Password',
                          style: boldText(20),
                        ),

                        Text(
                          'We sent a reset link to ${controller.emailController.text}\nenter 5 digit code that mentioned in the email',
                          style: semiBoldText(12, color: Color(0xFF545454),),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 30,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                'Password',
                                style: boldText(14),
                              ),
                              SizedBox(height: 8,),
                              controller.circuler.value?LoadingWidget():
                              CustomTextField(
                                isPassword: true,
                                hintText: "Enter your password",
                                inputFormatters: [],
                                textEditingController: controller.passwordController,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Please enter your password";
                                  }
                                },
                                isPrefixIcon: true,
                                icon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Icon(Icons.key),
                                ),
                              ),
                              SizedBox(height: 16,),


                              Text(
                                'Otp',
                                style: boldText(14),
                              ),
                              SizedBox(height: 8,),
                              CustomTextField(
                                isPassword: true,
                                inputFormatters: [],
                                textEditingController: controller.otpController,
                                hintText: "Enter your otp",
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Please enter your otp";
                                  }
                                },
                                isPrefixIcon: true,
                                icon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Icon(Icons.password_outlined),
                                ),
                              ),
                              SizedBox(height: 16,),


                              SizedBox(height: 17,),
                              CustomElevatedButton(
                                onPressed: () {
                                  if(controller.newPassFormKey.currentState!.validate()){
                                     controller.passwordChange(context);
                                  }
                                },
                                titleText: 'Register',
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
            );
          });
        },
      ),
    );
  }
}
