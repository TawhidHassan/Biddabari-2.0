import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:biddabari_new/features/Home/presentation/widget/popular_course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../../../AllCourse/presentation/controller/AllCourse_controller.dart';


class HomePopularCourseComponent extends StatelessWidget {
  const HomePopularCourseComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getAllPopularCourse();
    });
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'পলুপার কোর্সস',
                  style: boldText(16, color: Color(0xFF202244))
              ),

              // Row(
              //   children: [
              //     Text(
              //         'See All',
              //         style: boldText(12, color: Color(0xFF5F61F0))
              //     ),
              //     SizedBox(width: 12,),
              //     Assets.icons.forwordArrow.svg(height: 12)
              //   ],
              // ),
            ],
          ),
          SizedBox(height: 16,),
          // SizedBox(
          //   height: 30,
          //   width: 1.0.sw,
          //   child: ListView.builder(
          //     itemCount: 10,
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemBuilder: (context,index){
          //       return   HorizontalCategoryCard();
          //     },
          //   ),
          // ),
          // SizedBox(height: 24,),
          GetBuilder<AllCourseController>(
            assignId: true,
            builder: (controller) {
              return Obx(() {
                return controller.popularCourseLoading.value?
                Skeletonizer(
                  enabled: true,
                  child: SizedBox(
                    height: 250,
                    width: 1.0.sw,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width:280 ,
                          margin: EdgeInsets.only(right:16 ),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x26A8A4A4),
                                blurRadius: 15,
                                offset: Offset(0, 8),
                                spreadRadius: 0,)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 300,
                                  width: 1.0.sw,
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                                      image: DecorationImage(
                                          image: Assets.images.course.provider(),
                                          fit: BoxFit.fill
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'BCS',
                                              style: boldText(12,color:AppColors.orange400 ),
                                            ),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              padding: EdgeInsets.all(6),
                                              margin: EdgeInsets.only(top:8,right: 8 ),
                                              decoration: ShapeDecoration(
                                                shape: OvalBorder(
                                                  side: BorderSide(width: 1, color: Color(0xFF167F71)),
                                                ),
                                              ),
                                              child: Assets.icons.saveGreenSvg.svg(color: Color(0xFF167F71),height: 12,width: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 7,),
                                        Text(
                                          '48th BCS Foundation To..',
                                          style: boldText(16),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Text(
                                              '850/-',
                                              style: TextStyle(
                                                color: Color(0xFF5F61F0),
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(width: 2,),
                                            Text(
                                              '|',
                                              style: boldText(14),
                                            ),
                                            SizedBox(width: 16,),
                                            Assets.icons.star.svg(),
                                            SizedBox(width: 3,),
                                            Text(
                                              '4.2',
                                              style: extraBoldText(11),
                                            ),
                                            SizedBox(width: 16,),
                                            Text(
                                              '|',
                                              style: boldText(14),
                                            ),
                                            SizedBox(width: 16,),
                                            Text(
                                              '7830 Std',
                                              style: TextStyle(
                                                color: Color(0xFF202244),
                                                fontSize: 11,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w800,
                                              ),
                                            )
                                          ],
                                        )


                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ):
                SizedBox(
                  height: 250,
                  width: 1.0.sw,
                  child: ListView.builder(
                    itemCount: controller.popularCourseResponse.value!.popular_courses!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return PopularCourseCard(
                        course: controller.popularCourseResponse.value!.popular_courses![index],
                      );
                    },
                  ),
                );
              });
            },
          ),


        ],
      ),
    );
  }
}
