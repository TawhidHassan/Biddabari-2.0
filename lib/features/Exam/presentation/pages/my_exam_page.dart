import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:biddabari_new/features/Exam/presentation/controller/Exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/my_exam_card.dart';


class MyExamPage extends StatelessWidget {

  const MyExamPage({super.key,});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<ExamController>().getMyExam();
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
        title: Text("My Exams"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: SizedBox(height: 0.h,)),

            ///search bar
            ///home slider top part
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: ["Completed","Ongoing"].map((cat){
                    return Expanded(
                      child: HorizontalCategoryCard(
                        height: 42,
                        title: cat,
                      ),
                    );
                  }).toList(),
                ),
              ),

            ),

          ];
        },
        body: GetBuilder<ExamController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.examLoading.value?LoadingWidget():
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
                      child: controller.myExamReponse!.value==null||controller.myExamReponse!.value!.exams==null?SizedBox():ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.myExamReponse!.value!.exams!.length,
                          itemBuilder: (context,index){
                            return MyExamCard(
                              exam: controller.myExamReponse!.value!.exams![index],
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