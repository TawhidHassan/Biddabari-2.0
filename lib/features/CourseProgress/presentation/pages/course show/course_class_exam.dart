
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../../core/config/util/text_style.dart';
import '../../../../../core/routes/route_path.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';
import '../../widget/exam_context_card.dart';


class CourseClassExam extends StatelessWidget {
  final CourseSectionContent? courseSectionContent;
  final bool? isCourseExam;

  const CourseClassExam(
      {Key? key, this.courseSectionContent, this.isCourseExam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CourseProgressController>().getExamQuestions(
        courseSectionContent!.id.toString(),
        courseSectionContent!.hasClassXm!.toInt(), isCourseExam!);
    return GetBuilder<CourseProgressController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.keyboard_arrow_left)),
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Course Content"),
                  Text(courseSectionContent!.title ?? '',
                    style: semiBoldText(12,),),
                ],
              ),
            ),
            body: Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: GetBuilder<CourseProgressController>(
                  assignId: true,
                  builder: (controller) {
                    return SingleChildScrollView(
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
                    );
                  },
                ),
              ),
            ),
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: controller.questionResponse.value!.error == null? 80 : 100,
              child: Column(
                children: [

                  controller.questionResponse.value!.error != null?
                  Column(
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
                                //   "isClassExam":true,
                                //   "hasClassXm":courseSectionContent!.hasClassXm!.toInt()
                                // });

                                context.pushNamed(Routes.answerExamPage,extra: {
                                  "id": courseSectionContent!.id.toString(),
                                  "isCourseExam": isCourseExam,
                                  "iswriitenExam": false,
                                  "isClassExam":true,
                                  "hasClassXm":courseSectionContent!.hasClassXm!.toInt()
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
                              title: "See Video",
                              onTap: () {
                                context.pushNamed(Routes.videoContentPage,extra: {
                                  "courseSectionContent":courseSectionContent,
                                  "isCourseExam":false
                                },);
                              },
                            ),
                          ),
                        ],
                      ),

                    ],
                  ):
                  courseSectionContent!.hasClassXm == 1 ?
                  CustomButton(
                    color: AppColors.kPrimaryColorx,
                    height: 48,
                    width: 1.0.sw,
                    textColor: Colors.white,
                    borderRadius: 12,
                    title: "Start Exam",
                    onTap: () {
                      // Navigator.pushNamed(context, EXAM_PAGE, arguments: {
                      //   "id": courseSectionContent!.id.toString(),
                      //   "hasExam": courseSectionContent!.hasClassXm,
                      //   "isCourseExam": true,
                      //   "contentExam": true,
                      // });
                      //

                      context.pushNamed(Routes.givenExamPage,extra:{
                        "id": courseSectionContent!.id.toString(),
                        "hasExam": courseSectionContent!.hasClassXm,
                        "isCourseExam": true,
                        "contentExam": true,
                      });
                    },
                  ) :
                  CustomButton(
                    color: getTime(
                        courseSectionContent!.examEndTime.toString()) ==
                        "Not late" ? AppColors.primaryColor : Colors.blueGrey,
                    height: 48,
                    width: 1.0.sw,
                    textColor: Colors.white,
                    borderRadius: 12,
                    title: getTime(
                        courseSectionContent!.examEndTime.toString()) ==
                        "Not late" ? "Start Exam" : "Exam Time Over",
                    onTap: () {
                      if (getTime(courseSectionContent!.examEndTime.toString()) == "Not late") {
                        // Navigator.pushNamed(context, EXAM_PAGE, arguments: {
                        //   "id": courseSectionContent!.id.toString(),
                        //   "hasExam": courseSectionContent!.hasClassXm,
                        //   "isCourseExam": true,
                        // });
                        context.pushNamed(Routes.givenExamPage,extra:{
                          "id": courseSectionContent!.id.toString(),
                          "hasExam": courseSectionContent!.hasClassXm,
                          "isCourseExam": true,
                          "iswriitenExam": false
                        });
                      }
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
    if (currentTime.isAfter(dateTime)) {
      return 'Late';
    } else {
      return 'Not late';
    }

    // return formattedTime.toString();
  }


}
