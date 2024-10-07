import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import 'category_card.dart';
import 'course_card.dart';

class HomeRunningCourseComponent extends StatelessWidget {
  const HomeRunningCourseComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'চলমান কোর্স সমূহ ',
                style:boldText(16,color: Color(0xFF202244))
              ),

              Row(
                children: [
                  Text(
                    'See All',
                    style:boldText(12,color: Color(0xFF5F61F0))
                  ),
                  SizedBox(width: 12,),
                  Assets.icons.forwordArrow.svg(height: 12)
                ],
              ),
            ],
          ),
          SizedBox(height: 19,),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 3/4
            ),
            itemCount:5,
            itemBuilder: (context, index) {
              return CourseCard(

              );
            },
          )
        ],
      ),
    );
  }
}
