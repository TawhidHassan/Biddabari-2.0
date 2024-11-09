import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryCard extends StatelessWidget {
  final String? title;
  final bool? active;
  final double? textSize,height;
  const HorizontalCategoryCard({super.key, this.title, this.active=false, this.textSize=12, this.height=30});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(right: 12),
      height: height!,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, -0.02),
          end: Alignment(-1, 0.02),
          colors:active!? [ Color(0xFF61045F),Color(0xFFAA076B)]:[Color(0xFFE8F1FF),Color(0xFFE8F1FF)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Center(
        child: Text(
          title??'বিসিএস ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color:active!? Colors.white:AppColors.textClorColor,
            fontSize: textSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
