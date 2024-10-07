import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
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
                  'Forgot Password',
                  style: boldText(20),
                ),

                Text(
                  'Please enter your email to reset the password',
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
                      CustomTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                          CustomTextInputFormatter(),
                          // FilteringTextInputFormatter.allow(RegExp(r'^01[7835]\d*')),
                          LengthLimitingTextInputFormatter(11),
                        ],
                        validator: (text){},
                        isPrefixIcon: true,
                        icon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Assets.icons.email.svg(),
                        ),
                      ),
                      SizedBox(height: 48,),

                      CustomElevatedButton(
                        onPressed: (){

                        },
                        titleText:'Reset Password',
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
