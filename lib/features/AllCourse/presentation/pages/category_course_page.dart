import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/data/Category/Categorie.dart';
import '../../../../core/common/widgets/card/course_list_card.dart';
import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/common/widgets/shimer component/shimer_list.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../BookStore/presentation/widget/popular_book_component.dart';
import '../../../Home/presentation/widget/home_slider_component.dart';
import '../widget/all_course_component.dart';

class CategoryCoursePage extends StatefulWidget {
  final Categorie? categorie;

  const CategoryCoursePage({super.key, this.categorie});

  @override
  State<CategoryCoursePage> createState() => _CategoryCoursePageState();
}

class _CategoryCoursePageState extends State<CategoryCoursePage> {

  final controllerx = Get.find<AllCourseController>();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
     controllerx.categoryCoursePageUrl.value.add(widget.categorie!.slug);
     controllerx.categoryCoursePage.value =controllerx.categoryCoursePage.value + 1;
     controllerx.getCategoryCourse(controllerx.categoryCoursePageUrl.value[controllerx.categoryCoursePage.value-1]);

     controllerx.update();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didpop,rr){
        print(controllerx.categoryCoursePage.value);
        print(controllerx.categoryCoursePageUrl.value);
        if (controllerx.categoryCoursePage.value == 0) {
          controllerx.categoryCoursePage.value=0;
          controllerx.categoryCoursePageUrl.value=[];
          if(context.canPop()){
            context.pop();
          }

        } else {
          controllerx.categoryCoursePageUrl.value.remove(widget.categorie!.slug);
          controllerx.categoryCoursePage.value=controllerx.categoryCoursePage.value>0?controllerx.categoryCoursePage.value-1:controllerx.categoryCoursePage.value;
          controllerx.categoryCoursePageUrl.value.isNotEmpty?
          controllerx.getCategoryCourse(controllerx.categoryCoursePageUrl.value[(controllerx.categoryCoursePage.value>0?controllerx.categoryCoursePage.value-1:0 )]):null;
          if(context.canPop()){
            context.pop();
          }
        }
      },
      child: GetBuilder<AllCourseController>(
        assignId: false,
        builder: (controller) {
          return Obx(() {
            return Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    print(controller.categoryCoursePage.value);
                    print(controller.categoryCoursePageUrl.value);
                    if (controller.categoryCoursePage.value == 0) {
                      controller.categoryCoursePage.value=0;
                      controller.categoryCoursePageUrl.value=[];
                      if(context.canPop()){
                        context.pop();
                      }
                    } else {
                      controller.categoryCoursePageUrl.value.remove(widget.categorie!.slug);
                      controller.categoryCoursePage.value=controller.categoryCoursePage.value>0?controller.categoryCoursePage.value-1:controller.categoryCoursePage.value;
                      controller.categoryCoursePageUrl.value.isNotEmpty?
                      controller.getCategoryCourse(controller.categoryCoursePageUrl.value[(controller.categoryCoursePage.value>0?controller.categoryCoursePage.value-1:0 )]):null;
                      if(context.canPop()){
                        context.pop();
                      }
                    }


                  },
                  child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Assets.icons.backArrow.svg()),
                ),
                title: Text(widget.categorie!.name ?? ""),
              ),
              body:  controller.categoryCourseLoading.value ?
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
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
                        ),
                        ShimerList()
                      ],
                    ),
                  ),
                ) :
                controller.courseCategoryResponse.value == null &&
                    controller.categoryCourseLoading.value == false ?
                EmptyWidget()
                    :
                Container(
                  height: 1.0.sh,
                  width: 1.0.sw,
                  color: AppColors.primaryBackground,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: controller.courseCategoryResponse.value!.courseCategory!.course_categories!.isEmpty ? 0 : 36,
                          width: 1.0.sw,
                          child: ListView.builder(
                            shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.courseCategoryResponse
                                  .value!.courseCategory!
                                  .course_categories!
                                  .length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                        Routes.categoryCoursePage,
                                        extra: controller
                                            .courseCategoryResponse.value!
                                            .courseCategory!
                                            .course_categories![index]);
                                  },
                                  child: HorizontalCategoryCard(
                                    title: controller
                                        .courseCategoryResponse
                                        .value!.courseCategory!
                                        .course_categories![index].name,
                                  ),
                                );
                              }
                          ),
                        ),

                        SizedBox(height: 12,),

                        controller.courseCategoryResponse.value!
                            .courseCategory!.courses!.isEmpty ?
                        Container(
                            margin: EdgeInsets.only(top: 200),
                            child: EmptyWidget(
                              title: "There has no course",))
                            :
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.courseCategoryResponse
                                .value!.courseCategory!.courses!.length,
                            itemBuilder: (context, index) {
                              return CourseListCard(
                                course: controller.courseCategoryResponse
                                    .value!.courseCategory!
                                    .courses![index],);
                            }
                        ),

                      ],
                    ),
                  ),
                ),
              );
          });
        },
      ),
    );
  }
}