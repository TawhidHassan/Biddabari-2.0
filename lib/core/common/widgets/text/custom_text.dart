import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/dimensions.dart';



class CustomText extends StatelessWidget {
 const  CustomText(
      {super.key,
        this.maxLines ,
        this.textAlign = TextAlign.start,
        this.left = 0,
        this.right = 0,
        this.top = 0,
        this.bottom = 0,
        this.fontSize = 16,
        this.fontWeight =FontWeight.w500,
        this.color = AppColors.blackColor,
        required this.text, this.overflow = TextOverflow.ellipsis,
        this.textStyle});

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int ? maxLines;
  final TextOverflow overflow;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(
        textAlign: textAlign,
        text,maxLines: maxLines,
        overflow: overflow,
        style: textStyle ?? GoogleFonts.roboto(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
