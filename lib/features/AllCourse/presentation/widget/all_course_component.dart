import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/common/widgets/shimer%20component/shimer_grid.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/utils/system_util.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/card/book_card.dart';
import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../controller/AllCourse_controller.dart';
import 'all_course_card.dart';

class AllCourseComponent extends StatelessWidget {
  const AllCourseComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getAllCourse();
    });
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
                controller.allCourseLoading.value==false&&controller.allCourseResponse.value==null?
                SizedBox():
                controller.allCourseLoading.value&&controller.allCourseResponse.value==null?
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
                      itemBuilder: (context,index){
                        return   HorizontalCategoryCard(
                          active: false,
                          title: "ddd",
                        );
                      },
                    ),
                  ),
                ):
                SizedBox(
                  height: 30,
                  width: 1.0.sw,
                  child: ListView.builder(
                    itemCount: controller.allCourseResponse.value!.courseCategories!.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return   InkWell(
                        onTap: (){
                          controller!.selectCat(index,controller.allCourseResponse.value!.courseCategories![index]);
                        },
                        child: HorizontalCategoryCard(
                          active: controller.selectedcategory.value==index,
                          title: controller.allCourseResponse.value!.courseCategories![index].name??"",
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24,),
                controller.allCourseResponse.value==null&&controller.allCourseLoading.value?
                ShimerGrid():
                controller.allCourseResponse.value==null&&controller.allCourseLoading.value==false?
                EmptyWidget():
                controller.allCourseResponse.value!.courseCategories![controller.selectedcategory.value].courses!.isEmpty?
                Column(
                  children: [
                    EmptyWidget(title: "There has no course",height: 200,),
                  ],
                ):
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: SystemUtil.getChildAspectRatio(context)
                  ),
                  itemCount:controller.allCourseResponse.value!.courseCategories![controller.selectedcategory.value].courses!.length,
                  itemBuilder: (context, index) {
                    return AllCourseCard(
                      course: controller.allCourseResponse.value!.courseCategories![controller.selectedcategory.value].courses![index],
                    );
                  },
                )
              ],
            ),
          );
        });
      },
    );
  }
}
