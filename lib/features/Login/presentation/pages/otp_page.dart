import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/utils/system_util.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: InkWell(
           onTap: (){
             context.pop();
           },
           child: Padding(
               padding: EdgeInsets.all(18),
               child: Assets.icons.backArrow.svg()),
         ),
     ),
      body: Container(

        height: 1.0.sh,
        width: 1.0.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Check SMS',
                  style: boldText(20),
                ),

                Text(
                  'We sent a reset link to contact@dscode...com\nenter 5 digit code that mentioned in the email',
                  style: semiBoldText(12,color: Color(0xFF545454),),
                ),

                SizedBox(height: 45,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'মোবাইল নাম্বার /ইমেইল দিয়ে এগিয়ে যান ',
                        style: boldText(14),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 24),
                          child: PinCodeTextField(
                            backgroundColor: Colors.transparent,
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: false,
                            obscuringCharacter: '*',
                            // obscuringWidget: FlutterLogo(
                            //   size: 24,
                            // ),
                            blinkWhenObscuring: false,
                            animationType: AnimationType.fade,
                            validator: (v) {

                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(4),
                              fieldHeight: 60,
                              fieldWidth: 60,
                              selectedColor: AppColors.primaryColor,
                              inactiveColor: Color(0xFFF1EDFC),
                              inactiveFillColor: Color(0xFFF1EDFC),
                              activeFillColor: Color(0xFFF1EDFC),
                              selectedFillColor: Color(0xFFF1EDFC),
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            controller: null,
                            keyboardType: TextInputType.number,

                            onCompleted: (v) {
                              print(v + "complete");
                              // controller.otpText.value=v;
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print("print otp " + value);
                              // controller.otpText.value=value;
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc

                              return true;
                            },
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50,),
                          CustomElevatedButton(
                            onPressed: (){
                              context.pushNamed(Routes.setPasswordPage);
                            },
                            titleText:'সাবমিট করুন ',
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
                                color:Colors.white,
                                shape: OvalBorder(),
                              ),
                              child: Icon(Icons.arrow_forward_ios_sharp,color:AppColors.primaryColor,),
                            ) ,
                          ),
                          SizedBox(height: 27,),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Haven’t got the sms yet?',
                                  style: TextStyle(
                                    color: Color(0xFF777777),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xFF2A2A2A),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Resend otp',
                                  style: TextStyle(
                                    color: Color(0xFF5F61F0),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    height: 0.10,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
