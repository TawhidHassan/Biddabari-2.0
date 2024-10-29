import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/core/custom_assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../AllCourse/data/models/courseSection/CourseSection.dart';

class CourseContentCard extends StatelessWidget {
  final String? title,subTitle;
  final Callback? onTap;
  const CourseContentCard({super.key, this.title, this.onTap, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
        decoration: ShapeDecoration(
          color: Color(0xffF1F7FF),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.75, color: Color(0xFFB4BDC4)),
            borderRadius: BorderRadius.circular(6),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x26A8A4A4),
              blurRadius: 6,
              offset: Offset(3, 4),
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: Color(0xffF5F9FF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.75, color: Color(0xFFD9D9D9)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0xFF202244),
                          blurRadius: 12,
                          offset: Offset(-1, -1),
                          spreadRadius: -6,
                        )
                      ],
                    ),
                    child: Assets.icons.content.svg(),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                      child:subTitle==null?
                      Text(title??'',style: boldText(16,),maxLines: 1,)
                      :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title??'',style: boldText(16,),maxLines: 1,),
                          Text(subTitle??'',style: extraBoldText(14,color: Colors.green),maxLines: 1,),
                        ],
                      )
                  ),
                ],
              ),
            ),

            Assets.icons.forwordArrow.svg(color: AppColors.primaryColor)
          ],
        ),
      ),
    );
  }
}
