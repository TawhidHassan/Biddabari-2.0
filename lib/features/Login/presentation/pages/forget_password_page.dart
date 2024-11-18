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

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
            return  Container(
              height: 1.0.sh,
              width: 1.0.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: controller.forgetFormKey,
                    child: Column(
                      children: [
                        Text(
                          'Forgot/Change Password',
                          style: boldText(20),
                        ),

                        Text(
                          'Please enter your phone number to reset the password',
                          style: semiBoldText(12, color: Color(0xFF545454),),
                        ),

                        SizedBox(height: 45,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'মোবাইল নাম্বার দিয়ে এগিয়ে যান ',
                                style: boldText(14),
                              ),
                              SizedBox(height: 8,),
                              CustomTextField(
                                textEditingController: controller.emailController,
                                hintText: "Enter your mobile number",
                                inputFormatters: [

                                  FilteringTextInputFormatter.allow(
                                      RegExp(r"[0-9]")),
                                  CustomTextInputFormatter(),
                                  // FilteringTextInputFormatter.allow(RegExp(r'^01[7835]\d*')),
                                  LengthLimitingTextInputFormatter(11),
                                ],
                                validator: (text) {
                                  if(text!.isEmpty){
                                    return "Please enter your mobile number";
                                  }else if(text.length < 11){
                                    return "Please enter valid mobile number";
                                  }
                                },
                                isPrefixIcon: true,
                                icon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Assets.icons.email.svg(),
                                ),
                              ),
                              SizedBox(height: 48,),

                              controller.circuler.value?LoadingWidget():

                              CustomElevatedButton(
                                onPressed: () {
                                  if(controller.forgetFormKey.currentState!.validate()){
                                    controller.resetPassword(context);
                                  }
                                },
                                titleText: 'Get Otp',
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
