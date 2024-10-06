import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';
import '../Button/custom_button.dart';
import '../text/custom_text.dart';
class CustomCard extends StatelessWidget {

  final String ? imgSrc;
  final String ? name;
  final String ? number;
  final double ? height;
  final double ? width;
  final Widget ? button;
  final Widget ? icon;
  final Color ? color;
  final Color ? borderColor;
  final VoidCallback ? onTap;


  const CustomCard({super.key, this.imgSrc, this.name, this.number, this.height, this.width, this.onTap, this.button, this.icon, this.color, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      height: height??70,
     width: width,
      decoration: BoxDecoration(
          color: color?? Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:borderColor?? Color(0xffFF0844),
              width: 0.5)
      ),
      child: Row(
        children: [
          /// profile image
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imgSrc??"https://plus.unsplash.com/premium_photo-1681883482309-f405a895d6ec?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
            ),),
          SizedBox(width: 12,),
          /// name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text:name?? "MR Jafran mia",
                textStyle: robotoMedium.copyWith(
                    color: AppColors.primarySlate700,
                    fontSize: 12.sp
                ),
              ),
              SizedBox(height: 2,),
              Row(
                children: [
                icon ??  Assets.icons.icDiamond.svg(),
                  CustomText(text: number??"2345",
                    textStyle: robotoMedium.copyWith(
                        color: AppColors.primarySlate700,
                        fontSize: 12.sp
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(width: 24.w,),

        button ??  CustomButton(
            onTap: onTap,
            width: 36.w,
            borderRadius: 6,
            height: 32.h,
            child: Assets.icons.icPlus1.svg(),
          ),


        ],
      ),
    );
  }
}
