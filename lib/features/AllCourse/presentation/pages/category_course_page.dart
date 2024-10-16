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

class CategoryCoursePage extends StatelessWidget {
  final Categorie? categorie;

  const CategoryCoursePage({super.key, this.categorie});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getCategoryCourse(categorie!.slug);
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
        title: Text(categorie!.name ?? ""),
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
                  child: Column(
                    children: [
                      Search(
                        readOnly: true,
                        onTap: () {},
                        suffixIcon: Container(
                          width: 31,
                          height: 31,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, -0.02),
                              end: Alignment(-1, 0.02),
                              colors: [Color(0xFFAA076B), Color(0xFF61045F)],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Assets.icons.filter.svg(),
                        ),
                      ),
                      SizedBox(height: 26,),
                    ],
                  ),
                )
            ),

          ];
        },
        body: GetBuilder<AllCourseController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.categoryCourseLoading.value?LoadingWidget():
              Container(
                height: 1.0.sh,
                width: 1.0.sw,
                color: AppColors.primaryBackground,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: Row(
                          children: controller.catetegoryList.value.map((cat){
                            return Expanded(
                              child: HorizontalCategoryCard(
                                title: cat,
                              ),
                            );
                          }).toList(),
                        ),

                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 12,),
                    ),
                    SliverToBoxAdapter(
                      child:ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.courseCategoryResponse.value!.courseCategory!.courses!.length,
                          itemBuilder: (context,index){
                            return CourseListCard(course: controller.courseCategoryResponse.value!.courseCategory!.courses![index],);
                          }
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 80,),
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