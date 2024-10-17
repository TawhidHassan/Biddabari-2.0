
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class MoreOtptionCard extends StatelessWidget {
  final String? title,icon;
  final double? height,textSize;
  final VoidCallback? onTap;
  const MoreOtptionCard({super.key,this.title,this.icon, this.onTap, this.height=50, this.textSize=12, });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: 1.0.sw,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 18),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          shadows: [
            BoxShadow(
              color: Color(0x26A8A4A4),
              blurRadius: 15,
              offset: Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(icon!,height: (textSize!+12),color: Color(0xFF202244)),
                SizedBox(width: 12,),
                Text(title??"",style: semiBoldText(textSize!),)
              ],
            ),
            Assets.icons.forwordArrow.svg(color:Color(0xFF202244) )
          ],
        ),

      ),
    );
  }
}
