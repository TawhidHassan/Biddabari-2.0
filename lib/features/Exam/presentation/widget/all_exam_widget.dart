import 'package:biddabari_new/core/common/widgets/card/exam_card.dart';
import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/common/widgets/shimer%20component/shimer_grid.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/utils/system_util.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:biddabari_new/features/Exam/presentation/controller/Exam_controller.dart';
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

class AllExamComponent extends StatelessWidget {
  const AllExamComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamController>(
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
                        'Exams',
                        style: boldText(16, color: Color(0xFF202244))
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                controller.examLoading.value==false&&controller.batchExamResponse.value==null?
                SizedBox():
                controller.examLoading.value&&controller.batchExamResponse.value==null?
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
                Container(
                  height: 44,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.batchExamResponse.value!.examCategories!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          InkWell(
                            onTap: (){
                              controller.selectExamCat(controller.batchExamResponse.value!.examCategories![index].id,controller.batchExamResponse.value!.examCategories![index]);
                            },
                            child: HorizontalCategoryCard(
                              active:  controller.selectedExamcategory.value==controller.batchExamResponse.value!.examCategories![index].id,
                              title: controller.batchExamResponse.value!.examCategories![index].name??"",
                            ),
                          ),
                  ),
                ),

                SizedBox(height: 19,),
                controller.batchExamResponse.value==null&&controller.examLoading.value==true?
                     ShimerGrid():
                controller.batchExamResponse.value==null?EmptyWidget():
                controller.selectedExamcategory.value==0?
                controller.batchExamResponse.value!.allExams!.isEmpty?
                    EmptyWidget(height: 100, title: "There has no exam",):
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: SystemUtil.getChildAspectRatio(context)
                  ),
                  itemCount:controller.batchExamResponse.value!.allExams!.length,
                  itemBuilder: (context, index) {
                    return ExamCard(
                      exam: controller.batchExamResponse.value!.allExams![index],
                    );
                  },
                ):
                controller.examCategorieData.value!.batch_exams!.isEmpty?
                EmptyWidget(
                  height: 200,
                  title: "There has no exam",
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
                  itemCount:controller.examCategorieData.value!.batch_exams!.length,
                  itemBuilder: (context, index) {
                    return ExamCard(
                      exam: controller.examCategorieData.value!.batch_exams![index],
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
