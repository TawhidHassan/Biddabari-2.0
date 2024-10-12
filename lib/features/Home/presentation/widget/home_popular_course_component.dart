import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/Home/presentation/widget/popular_course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';


class HomePopularCourseComponent extends StatelessWidget {
  const HomePopularCourseComponent({super.key});

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
                'পলুপার কোর্সস',
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
          SizedBox(height: 16,),
          SizedBox(
            height: 30,
            width: 1.0.sw,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return   HorizontalCategoryCard();
              },
            ),
          ),
          SizedBox(height: 24,),
          SizedBox(
            height: 250,
            width: 1.0.sw,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return  PopularCourseCard();
              },
            ),
          ),


        ],
      ),
    );
  }
}
