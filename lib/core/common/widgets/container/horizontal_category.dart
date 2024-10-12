import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryCard extends StatelessWidget {
  final String? title;
  final bool? active;
  const HorizontalCategoryCard({super.key, this.title, this.active=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 33),
      margin: EdgeInsets.only(right: 12),
      height: 30,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, -0.02),
          end: Alignment(-1, 0.02),
          colors:active!? [ Color(0xFF61045F),Color(0xFFAA076B)]:[Color(0xFFE8F1FF),Color(0xFFE8F1FF)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          title??'বিসিএস ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color:active!? Colors.white:AppColors.textClorColor,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
