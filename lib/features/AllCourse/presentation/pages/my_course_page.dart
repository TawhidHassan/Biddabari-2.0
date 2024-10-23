import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/data/Category/Categorie.dart';
import '../../../../core/common/widgets/card/course_list_card.dart';
import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../BookStore/presentation/widget/popular_book_component.dart';
import '../../../Home/presentation/widget/home_slider_component.dart';
import '../widget/all_course_component.dart';
import '../widget/my_course_card.dart';

class MyCoursePage extends StatelessWidget {

  const MyCoursePage({super.key,});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getMyCourse();
    });
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text("My Course"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: SizedBox(height: 28.h,)),

            ///search bar
            ///home slider top part
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: ["Completed","Ongoing"].map((cat){
                    return Expanded(
                      child: HorizontalCategoryCard(
                        title: cat,
                      ),
                    );
                  }).toList(),
                ),
              ),

            ),

          ];
        },
        body: GetBuilder<AllCourseController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.myCourseLoading.value?LoadingWidget():
              Container(
                height: 1.0.sh,
                width: 1.0.sw,
                color: AppColors.primaryBackground,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 12,),
                    ),
                    SliverToBoxAdapter(
                      child: controller.myCourseResponse!.value==null||controller.myCourseResponse!.value!.courseOrders==null?SizedBox():ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.myCourseResponse!.value!.courseOrders!.length,
                          itemBuilder: (context,index){
                            return MyCourseCard(
                              course:controller.myCourseResponse!.value!.courseOrders![index],
                            );
                          }
                      ),
                    ),

                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }
}