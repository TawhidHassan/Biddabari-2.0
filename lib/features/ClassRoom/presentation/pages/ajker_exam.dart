import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../CourseProgress/presentation/widget/course_content_card.dart';
import '../controller/ClassRoom_controller.dart';

class ClassRoomAjkerExam extends StatelessWidget {
  const ClassRoomAjkerExam({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetBuilder<ClassRoomController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return controller.myClassExamLoading.value?
          LoadingWidget()
              :
          controller.myClassExamLoading.value==false&& controller.todayExamResponse.value==null?EmptyWidget(title: "Somethings wrong",):
          controller.todayExamResponse.value!.courseExams!.isEmpty?EmptyWidget(title: "There has no exam"):
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: controller.todayExamResponse.value!.courseExams!.length!,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CourseContentCard(
                onTap: (){
                  if(controller.todayExamResponse.value!.courseExams![index].contentType=="video"){
                    context.pushNamed(Routes.videoContentPage,extra: {
                      "courseSectionContent":controller.todayExamResponse.value!.courseExams![index],
                      "isCourseExam":true
                    },
                    );
                  }
                  else if(controller.todayExamResponse.value!.courseExams![index].contentType=="note"){
                    context.pushNamed(Routes.noteContentPage,extra: {
                      "courseSectionContent":controller.todayExamResponse.value!.courseExams![index],
                      "isive":false,
                      "isLink":false
                    },
                    );

                  }else if(controller.todayExamResponse.value!.courseExams![index].contentType=="live"){
                    context.pushNamed(Routes.noteContentPage,extra: {
                      "courseSectionContent":controller.todayExamResponse.value!.courseExams![index],
                      "isive":true,
                      "isLink":false
                    },
                    );

                  }else if(controller.todayExamResponse.value!.courseExams![index].contentType=="link"){
                    context.pushNamed(Routes.noteContentPage,extra: {
                      "courseSectionContent":controller.todayExamResponse.value!.courseExams![index],
                      "isive":false,
                      "isLink":true
                    },
                    );
                  }else if(controller.todayExamResponse.value!.courseExams![index].contentType=="pdf"){
                    context.pushNamed(Routes.pdfContentPage,extra: controller.todayExamResponse.value!.courseExams![index]);
                  } else if(controller.todayExamResponse.value!.courseExams![index].contentType=="assignment"){
                    context.pushNamed(Routes.assismentContentPage,extra:controller.todayExamResponse.value!.courseExams![index]);

                  }else if(controller.todayExamResponse.value!.courseExams![index].contentType=="exam"){
                    context.pushNamed(Routes.examContentPage,extra:{
                      "courseSectionContent":controller.todayExamResponse.value!.courseExams![index],
                      "isCourseExam":true
                    });

                  }
                  else if(controller.todayExamResponse.value!.courseExams![index].contentType=="written_exam"){
                    print(controller.todayExamResponse.value!.courseExams![index].examDurationInMinutes);

                    context.pushNamed(Routes.writtenExamContentPage,extra:{
                      "courseSectionContent":controller.todayExamResponse.value!.courseExams![index],
                      "isCourseExam":true
                    });
                  }
                },
                title: controller.todayExamResponse.value!.courseExams![index].title!,
                subTitle: controller.todayExamResponse.value!.courseExams![index].contentType!,
              );
            },
          );
        });
      },
    );
  }
}
