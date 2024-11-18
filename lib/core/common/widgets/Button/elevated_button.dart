import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/config/util/dimensions.dart';
import '../../../../core/config/util/style.dart';

import '../../../config/color/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color? borderColor;
  final double titleSize;
  final FontWeight titleWeight;
  final double borderRdius;
  final double buttonHeight;
  final double buttonMarginLeft;
  final double buttonMarginRight;
  final double? buttonWidth;

  final Widget? iconLeft;
  final Widget? iconRight;

  const CustomElevatedButton({
    required this.onPressed,
    required this.titleText,
    this.titleColor = AppColors.whiteColor,
    this.buttonColor =AppColors.primaryColor,
    this.titleSize = 16,
    this.borderRdius = 100,
    this.titleWeight = FontWeight.w500,
    this.buttonHeight = 48,
    this.buttonWidth,
    this.borderColor,
    this.iconLeft,
    this.iconRight,
    super.key, this.buttonMarginLeft=12,  this.buttonMarginRight=12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: buttonHeight.h,
        width: buttonWidth,
        // decoration: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(borderRdius),
        //
        //   gradient: LinearGradient(
        //     begin: Alignment(1.00, -0.02),
        //     end: Alignment(-1, 0.02),
        //     colors: [Color(0xFFAA076B), Color(0xFF61045F)],
        //   ),
        //
        //
        // ),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, 0.02) ,
            end:Alignment(1.00, -0.02),
            colors: [Color(0xFFAA076B), Color(0xFF61045F)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRdius),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 8,
              offset: Offset(1, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconLeft ?? SizedBox(),
              SizedBox(
                width: titleText==""?0: buttonMarginLeft,
              ),
               Text(
                titleText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: PoppinsMedium.copyWith(color: titleColor, fontSize: titleSize, fontWeight: titleWeight
                ),
                             ),
              SizedBox(width: titleText==""?0:buttonMarginRight,),
              iconRight ?? SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
}
