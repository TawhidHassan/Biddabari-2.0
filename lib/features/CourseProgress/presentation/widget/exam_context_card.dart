import 'package:flutter/material.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';

class ExamContextCard extends StatelessWidget {
  final String? title,value;
  const ExamContextCard({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title??'',
          style: boldText(16),),
        value==null?SizedBox():SizedBox(height: 6,),
        value==null?SizedBox():
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
              color: AppColors.primarySlate100,
              borderRadius: BorderRadius.circular(6)
          ),
          child: Center(
            child: Row(
              mainAxisAlignment:title==null?MainAxisAlignment.center: MainAxisAlignment.start,
              children: [
                Text( value??"",
                  style: semiBoldText(title==null?18:12, color:title==null?AppColors.textClorColor: Colors.green),)
              ],
            ),
          ),
        ),
        SizedBox(height: 12,),
      ],
    );
  }
}
