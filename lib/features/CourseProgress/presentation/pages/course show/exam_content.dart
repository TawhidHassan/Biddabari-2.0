import 'package:biddabari_new/core/common/widgets/Button/bottom_checkout_section.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/config/util/text_style.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';
import '../../widget/exam_context_card.dart';



class ExamContentPage extends StatelessWidget {
  final CourseSectionContent? courseSectionContent;
  final bool? isCourseExam;

  const ExamContentPage(
      {Key? key, this.courseSectionContent, this.isCourseExam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      Get.find<CourseProgressController>().getExamQuestions(
          courseSectionContent!.id.toString(),
          courseSectionContent!.hasClassXm!.toInt(), isCourseExam!);
    });
    return GetBuilder<CourseProgressController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Assets.icons.backArrow.svg())),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Exam Content"),
                ],
              ),


            ),
            body: Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    ExamContextCard(value: courseSectionContent!.title??'',),

                    ExamContextCard(title: "Exam Name",value:  courseSectionContent!.title??'',),
                    ExamContextCard(title: "Exam Type",value: courseSectionContent!.contentType ?? '',),
                    ExamContextCard(title: "পরীক্ষা শুরুর সময়",
                      value:courseSectionContent!.examStartTime!=null?
                      DateFormat('dd MMM yyyy hh:mm a').format(DateTime.parse(courseSectionContent!.examStartTime))
                          :
                      "",),
                    ExamContextCard(title: "পরীক্ষা শেষের সময়",
                      value:courseSectionContent!.examEndTime!=null ?
                      DateFormat('dd MMM yyyy hh:mm a').format(DateTime.parse(
                          courseSectionContent!.examEndTime
                      )) :"",),

                    ExamContextCard(title: "সর্বমোট প্রশ্ন",value:courseSectionContent!.examTotalQuestions ?? "",),
                    ExamContextCard(title: "ফলাফল প্রকাশ",
                      value:
                      courseSectionContent!.examResultPublishTime!=null?
                      DateFormat('dd MMM yyyy hh:mm a').format(DateTime.parse(
                          courseSectionContent!.examResultPublishTime!
                      )) :"",),




                  ],
                ),
              ),
            ),
            bottomSheet:
            controller.examCirculer.value ?
            LoadingWidget()
                :
            courseSectionContent!.examMode == "exam" && courseSectionContent!.examEndTime == null ?
            Container(
              height: 100,
            ) :
            courseSectionContent!.examMode == "exam" ||
                courseSectionContent!.examMode == "group" ?
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26706E6E),
                    blurRadius: 12,
                    offset: Offset(-3, -1),
                    spreadRadius: 0,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              height: controller.questionResponse.value!.error == null &&
                  getTime(courseSectionContent!.examEndTime.toString()) ==
                      "Not late" ? 80 : 100,
              child: Column(
                children: [
                  SizedBox(height: 6,),
                  controller.questionResponse.value!.error == null &&
                      getTime(courseSectionContent!.examEndTime.toString()) == "Not late" ?
                   SizedBox()
                      :
                  Container(
                    margin: EdgeInsets.only(top: 4,bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 5,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: 6,),
                            Text("Exam Has Ended", style: semiBoldText(
                                16),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  getTime(courseSectionContent!.examEndTime.toString()) ==
                      "Not late" ? SizedBox() : SizedBox(height: 6,),

                  controller.questionResponse.value!.error == null &&
                      getTime(courseSectionContent!.examEndTime.toString()) ==
                          "Not late" ? SizedBox()
                      :
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: Colors.blueAccent,
                          height: 48,
                          width: 1.0.sw,
                          textColor: Colors.white,
                          borderRadius: 12,
                          title: "See Answer",
                          onTap: () {
                            print(courseSectionContent!.id.toString());
                            // Navigator.pushNamed(
                            //     context, SEE_ANSWER_PAGE, arguments: {
                            //   "id": courseSectionContent!.id.toString(),
                            //   "isCourseExam": isCourseExam,
                            //   "iswriitenExam": false,
                            //   "hasClassXm":courseSectionContent!.hasClassXm!.toInt(),
                            //   "isClassExam":false
                            // });
                            context.pushNamed(Routes.answerExamPage,extra: {
                                "id": courseSectionContent!.id.toString(),
                                "isCourseExam": isCourseExam,
                                "iswriitenExam": false,
                                "hasClassXm":courseSectionContent!.hasClassXm!.toInt(),
                                "isClassExam":false
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 6,),
                      Expanded(
                        child: CustomButton(
                          color: AppColors.textClorColor,
                          height: 48,
                          width: 1.0.sw,
                          textColor: Colors.white,
                          borderRadius: 12,
                          title: "See Ranking",
                          onTap: () {
                            // Navigator.pushNamed(context, EXAM_PAGE,arguments: {
                            //   "id":courseSectionContent!.id.toString(),
                            //   "hasExam":courseSectionContent!.hasClassXm
                            // });
                            // Navigator.pushNamed(
                            //     context, RANKING_EXAM_PAGE, arguments: {
                            //   "id": courseSectionContent!.id.toString(),
                            //   "isCourseExam":isCourseExam
                            // });

                            context.pushNamed(Routes.rankExamPage,extra: {
                              "id": courseSectionContent!.id.toString(),
                              "isCourseExam":isCourseExam
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  courseSectionContent!.examEndTime == null ? SizedBox() :
                  controller.questionResponse.value!.error == null &&
                      getTime(courseSectionContent!.examEndTime.toString()) == "Not late"&& getEarlyTime(courseSectionContent!.examStartTime.toString())=="Not Early"
                      ?

                  CustomButton(
                    color: AppColors.primaryColor,
                    height: 48,
                    width: 1.0.sw,
                    textColor: Colors.white,
                    borderRadius: 12,
                    title: "Start Exam",
                    onTap: () {
                      Logger().w(courseSectionContent!.hasClassXm);
                      // Navigator.pushNamed(context, EXAM_PAGE, arguments: {
                      //   "id": courseSectionContent!.id.toString(),
                      //   "hasExam": courseSectionContent!.hasClassXm,
                      //   "isCourseExam": isCourseExam,
                      //   "iswriitenExam": false
                      // });

                      context.pushNamed(Routes.givenExamPage,extra:{
                        "id": courseSectionContent!.id.toString(),
                          "hasExam": courseSectionContent!.hasClassXm,
                          "isCourseExam": isCourseExam,
                          "iswriitenExam": false
                      });
                    },
                  ) : Container(
                    width: 1.0.sw,
                    child: Center(child: Text(getEarlyTime(courseSectionContent!.examStartTime.toString())=="Not Early"?"":"There is still time left for the exam to start ",style: boldText(14,color: AppColors.primaryColor),)),
                  ),

                ],
              ),
            ) :
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: 130,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: Colors.blueAccent,
                          height: 48,
                          width: 1.0.sw,
                          textColor: Colors.white,
                          borderRadius: 12,
                          title: "See Answer",
                          onTap: () {
                            print(courseSectionContent!.id.toString());
                            // Navigator.pushNamed(
                            //     context, SEE_ANSWER_PAGE, arguments: {
                            //   "id": courseSectionContent!.id.toString(),
                            //   "isCourseExam": isCourseExam,
                            //   "iswriitenExam": false,
                            //   "hasClassXm":courseSectionContent!.hasClassXm!.toInt(),
                            //   "isClassExam":false
                            // });
                            context.pushNamed(Routes.answerExamPage,extra: {
                                "id": courseSectionContent!.id.toString(),
                                "isCourseExam": isCourseExam,
                                "iswriitenExam": false,
                                "hasClassXm":courseSectionContent!.hasClassXm!.toInt(),
                                "isClassExam":false
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6,),
                  CustomButton(
                    color: AppColors.primaryColor,
                    height: 48,
                    width: 1.0.sw,
                    textColor: Colors.white,
                    borderRadius: 12,
                    title: "Start Exam",
                    onTap: () {
                      Logger().w(courseSectionContent!.hasClassXm);
                      // Navigator.pushNamed(context, EXAM_PAGE, arguments: {
                      //   "id": courseSectionContent!.id.toString(),
                      //   "hasExam": courseSectionContent!.hasClassXm,
                      //   "isCourseExam": isCourseExam,
                      //   "iswriitenExam": false
                      // });
                      context.pushNamed(Routes.givenExamPage,extra:{
                          "id": courseSectionContent!.id.toString(),
                          "hasExam": courseSectionContent!.hasClassXm,
                          "isCourseExam": isCourseExam,
                          "iswriitenExam": false
                      });
                    },
                  ),

                ],
              ),
            ),
          );
        });
      },
    );
  }

  String getTime(String? lastTime) {
    DateTime currentTime = DateTime.now();

    String dateString = lastTime!;
    DateTime dateTime = DateTime.parse(dateString);
    // Logger().i(currentTime);
    // Logger().i(dateTime);
    // Logger().d(currentTime.difference(dateTime).inMinutes);
    if (currentTime.isAfter(dateTime)) {
      return 'Late';
    } else {
      return 'Not late';
    }
    // return formattedTime.toString();
  }

  String getEarlyTime(String? lastTime) {
    DateTime currentTime = DateTime.now();

    String dateString = lastTime!;
    DateTime dateTime = DateTime.parse(dateString);
    if (currentTime.isBefore(dateTime)) {
      return 'Early';
    } else {
      return 'Not Early';
    }
    // return formattedTime.toString();
  }

}
