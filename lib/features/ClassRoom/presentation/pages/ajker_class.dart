import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/common/widgets/shimer component/shimer_list.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../CourseProgress/presentation/widget/course_content_card.dart';
import '../controller/ClassRoom_controller.dart';

class ClassRoomAjkerClass extends StatelessWidget {
  const ClassRoomAjkerClass({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ClassRoomController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return
            controller.myClassLoading.value?
          Column(
            children: [
              ShimerList(
                listCount: 3,
              ),
              Text("Please wait,something its take few second",style: boldText(14,color: AppColors.primaryColor),)
            ],
          )
              :
            controller.myClassLoading.value==false&& controller.myClassResponse.value==null?EmptyWidget(title: "Somethings wrong",):
            controller.myClassResponse.value!.courseClassContents!.isEmpty?EmptyWidget(title: "There has no class"):

          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: controller.myClassResponse.value!.courseClassContents!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CourseContentCard(
                onTap: (){
                  if(controller.myClassResponse.value!.courseClassContents![index].contentType=="video"){
                    context.pushNamed(Routes.videoContentPage,extra: {
                      "courseSectionContent":controller.myClassResponse.value!.courseClassContents![index],
                      "isCourseExam":true
                    },
                    );
                  }
                  else if(controller.myClassResponse.value!.courseClassContents![index].contentType=="note"){
                    context.pushNamed(Routes.noteContentPage,extra: {
                      "courseSectionContent":controller.myClassResponse.value!.courseClassContents![index],
                      "isive":false,
                      "isLink":false
                    },
                    );

                  }else if(controller.myClassResponse.value!.courseClassContents![index].contentType=="live"){
                    context.pushNamed(Routes.noteContentPage,extra: {
                      "courseSectionContent":controller.myClassResponse.value!.courseClassContents![index],
                      "isive":true,
                      "isLink":false
                    },
                    );

                  }else if(controller.myClassResponse.value!.courseClassContents![index].contentType=="link"){
                    context.pushNamed(Routes.noteContentPage,extra: {
                      "courseSectionContent":controller.myClassResponse.value!.courseClassContents![index],
                      "isive":false,
                      "isLink":true
                    },
                    );
                  }else if(controller.myClassResponse.value!.courseClassContents![index].contentType=="pdf"){
                    context.pushNamed(Routes.pdfContentPage,extra: controller.myClassResponse.value!.courseClassContents![index]);
                  } else if(controller.myClassResponse.value!.courseClassContents![index].contentType=="assignment"){
                    context.pushNamed(Routes.assismentContentPage,extra:controller.myClassResponse.value!.courseClassContents![index]);

                  }else if(controller.myClassResponse.value!.courseClassContents![index].contentType=="exam"){
                    context.pushNamed(Routes.examContentPage,extra:{
                      "courseSectionContent":controller.myClassResponse.value!.courseClassContents![index],
                      "isCourseExam":true
                    });

                  }
                  else if(controller.myClassResponse.value!.courseClassContents![index].contentType=="written_exam"){
                    print(controller.myClassResponse.value!.courseClassContents![index].examDurationInMinutes);

                    context.pushNamed(Routes.writtenExamContentPage,extra:{
                      "courseSectionContent":controller.myClassResponse.value!.courseClassContents![index],
                      "isCourseExam":true
                    });
                  }
                },
                title: controller.myClassResponse.value!.courseClassContents![index].title!,
                subTitle: controller.myClassResponse.value!.courseClassContents![index].contentType!,
              );
            },
          );
        });
      },
    );
  }
}
