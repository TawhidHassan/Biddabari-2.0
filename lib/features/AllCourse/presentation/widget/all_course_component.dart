import 'dart:async';

import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/common/widgets/shimer%20component/shimer_grid.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/utils/system_util.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/card/book_card.dart';
import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../../../../core/routes/route_path.dart';
import '../controller/AllCourse_controller.dart';
import 'all_course_card.dart';

class AllCourseComponent extends StatefulWidget {
  const AllCourseComponent({super.key});

  @override
  State<AllCourseComponent> createState() => _AllCourseComponentState();
}

class _AllCourseComponentState extends State<AllCourseComponent> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getAllCourse(1);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
      assignId: true,
      builder: (homeController) {
        return GetBuilder<AllCourseController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child:
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'All Course',
                            style: boldText(16, color: Color(0xFF202244))
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),

                    homeController.categoryLoading.value  ?
                    Container(
                      margin: EdgeInsets.only(bottom: 32),
                      height: 30,
                      width: 1.0.sw,
                      child: Skeletonizer(
                        enabled: true,
                        child: ListView.builder(
                          itemCount: 8,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return HorizontalCategoryCard(
                              active: false,
                              title: "ddd",
                            );
                          },
                        ),
                      ),
                    ) :
                    homeController.categoryLoading.value == false &&
                        homeController.categoryResponse.value == null ?
                    SizedBox() :
                    SizedBox(
                      height: 30,
                      width: 1.0.sw,
                      child: ListView.builder(
                        itemCount: homeController.categoryResponse.value!.courseCategories!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.pushNamed(Routes.categoryCoursePage,extra: homeController.categoryResponse.value!.courseCategories![index]);
                            },
                            child: HorizontalCategoryCard(
                              title:homeController.categoryResponse.value!.courseCategories![index].name ?? "",
                            ),
                          );
                        },
                      ),
                    ),


                    SizedBox(height: 24,),
                    controller.allCourseResponse.value == null &&
                        controller.allCourseLoading.value ?
                    ShimerGrid() :
                    controller.allCourseResponse.value == null &&
                        controller.allCourseLoading.value == false ?
                    EmptyWidget() :
                    controller.courseList.isEmpty ?
                    Column(
                      children: [
                        EmptyWidget(title: "There has no course", height: 200,),
                      ],
                    ) :
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: SystemUtil.getChildAspectRatio(
                              context)
                      ),
                      itemCount:  controller.courseList.length+
                          (controller.coursePagingCirculer.value ? 1 : 0),
                      itemBuilder: (context, index) {
                      if (index < controller.courseList.length) {
                        return AllCourseCard(
                          course:  controller.courseList[index],
                        );
                      }else{
                        Timer(const Duration(milliseconds: 30), () {
                          controller.controllerScroolCourse
                              .jumpTo(controller.controllerScroolCourse.position
                              .maxScrollExtent);
                        });
                        return const Center(
                          child: CircularProgressIndicator(),);
                      }
                      },
                    )
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }
}
