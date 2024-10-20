
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class NotificationCard extends StatelessWidget {
  final String? title,icon,details;
  final double? height,textSize;
  final VoidCallback? onTap;
  const NotificationCard({super.key,this.title,this.details,this.icon, this.onTap, this.height=50, this.textSize=12, });

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
          color: Color(0xFFF1F7FF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            side: BorderSide(
              color: Color(0xFFB4BDC4).withOpacity(0.20), // Set the border color
              width: 1, // Set the border width
            ),
          ),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 28,
                child: SvgPicture.asset(icon!,height: (textSize!+12),color: Color(0xFF202244))
            ),
            SizedBox(width: 18,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title??"",style: semiBoldText(textSize!),),
                SizedBox(height: 2,),
                Text(details??"",style: regularText(textSize!,color: Color(0xFF545454)),),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
