import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';
import '../text/custom_text.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.color,
    this.title,
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
    this.borderRadius,
    this.onTap,
    this.border,
    this.titleColor,});

  final Widget ? child;
  final double ?height;
  final double ?width;
  final double ?paddingLeft;
  final double ?paddingRight;
  final double ?paddingTop;
  final double ?paddingBottom;
  final double ?borderRadius;
  final Color ?color;
  final Color ?border;
  final Color ?titleColor;
  final String ? title;
  final VoidCallback ? onTap;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            right: paddingRight??0,left:paddingLeft??0,
            top: paddingTop??0,bottom: paddingBottom??0 ),
        alignment: Alignment.center,
        height:height?? 36.h,
        width:width?? 36.w,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(borderRadius??8),
          border: Border.all(color:border?? Colors.transparent)
        ),
        child: child?? CustomText(text: title??"",textStyle: robotoMedium.copyWith(
            color: titleColor??AppColors.primarySlate700,
            fontSize: 14.sp

        ),),
      ),
    );
  }
}
