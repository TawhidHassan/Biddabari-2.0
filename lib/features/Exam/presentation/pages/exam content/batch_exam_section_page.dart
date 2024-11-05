import 'package:biddabari_new/features/Exam/presentation/controller/Exam_controller.dart';
import 'package:biddabari_new/features/Teacher/presentation/pages/teacher_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/config/color/app_colors.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';
import '../../../../CourseProgress/presentation/widget/course_content_card.dart';



class BatchExamSectionPage extends StatelessWidget {
 final String? id;
  const BatchExamSectionPage({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () {
      Get.find<ExamController>().getMyExamSection(int.parse(id!));
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
        title: Text("Exam details"),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: GetBuilder<ExamController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.circuler.value?LoadingWidget():

              controller.myExamSectionReponse.value!.batchExam!.batch_exam_sections!.isEmpty?EmptyWidget():
              ListView.builder(
                  itemCount:controller.myExamSectionReponse.value!.batchExam!.batch_exam_sections!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){

                      },
                      child:CourseContentCard(
                        onTap: (){
                          // Navigator.pushNamed(context, BTACH_EXAM_SECTION_CONTENT_LIST_PAGE,arguments: {
                          //   "batchExamSection":controller.myExamSectionReponse.value!.batchExam!.batch_exam_sections![index]
                          // });
                          context.pushNamed(Routes.myExamContentPage,extra:controller.myExamSectionReponse.value!.batchExam!.batch_exam_sections![index] );
                        },
                        title: controller.myExamSectionReponse.value!.batchExam!.batch_exam_sections![index].title!,
                        subTitle: controller.myExamSectionReponse.value!.batchExam!.batch_exam_sections![index].available_at??"",
                      ),



                    );
                  }
              );
            });
          },
        ),
      ),
    );
  }
}
