import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/Home/presentation/widget/popular_course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import 'category_card.dart';
import 'course_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTopMentorComponent extends StatelessWidget {
  const HomeTopMentorComponent({super.key});

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
                'টপ মেন্টোর ',
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
          SizedBox(
            height: 250,
            width: 1.0.sw,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return  Container(
                  width:160 ,
                  margin: EdgeInsets.only(right:16 ),
                  decoration: ShapeDecoration(
                    color: AppColors.primaryBackground,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [

                          SizedBox(
                            height:130,
                            child: Container(
                              height: 180,
                              width: 1.0.sw,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                                  image: DecorationImage(
                                      image: Assets.images.teacherBg.provider(),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                          ),
                          Positioned(
                              top: -50,
                              child: Assets.images.teacher.image(height: 180)),
                        ],
                      ),
                      Container(

                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    'Sayef Mahmud',
                                    style: boldText(16),
                                  ),
                                  SizedBox(height: 2,),

                                  Text(
                                    'Sayef Mahmud',
                                    style: boldText(12,color: Color(0xFF70747E)),
                                  ),
                                  SizedBox(height: 12,),

                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
