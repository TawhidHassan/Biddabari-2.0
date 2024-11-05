import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/config/color/app_colors.dart';
import '../../../../../core/config/util/text_style.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';
import '../../widget/exam_context_card.dart';

class WritenExamContentPage extends StatelessWidget {
  final CourseSectionContent? courseSectionContent;
  final bool? isCourseExam;

  const WritenExamContentPage(
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
                  Text("Course Content"),
                ],
              ),
            ),
            body: Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExamContextCard(value: courseSectionContent!.title??'',),

                    ExamContextCard(title: "Exam Name",value:  courseSectionContent!.title??'',),
                    ExamContextCard(title: "Exam Type",value: courseSectionContent!.contentType ?? '',),

                    ExamContextCard(title: "পরীক্ষা শুরুর সময়",
                      value:courseSectionContent!.writtenStartTime!=null?
                      DateFormat('dd MMM yyyy hh:mm a').format(DateTime.parse(courseSectionContent!.writtenStartTime))
                          :
                      "",),
                    ExamContextCard(title: "পরীক্ষা শেষের সময়",
                      value:courseSectionContent!.writtenEndTime!=null ?
                      DateFormat('dd MMM yyyy hh:mm a').format(DateTime.parse(
                          courseSectionContent!.writtenEndTime
                      )) :"",),

                    ExamContextCard(title: "সর্বমোট প্রশ্ন",value:courseSectionContent!.writtenTotalQuestions ?? "",),
                    ExamContextCard(title: "সর্বমোট বিষয়",value:courseSectionContent!.writtenTotalSubject ?? "",),
                    ExamContextCard(title: "ফলাফল প্রকাশ",value:courseSectionContent!.writtenPublishTime ?? "",),

                    Row(
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
                            Text("বিস্তারিত", style: semiBoldText(
                                16),)
                          ],
                        ),

                      ],
                    ),
                    Html(data: courseSectionContent!.writtenDescription ?? ''),

                    SizedBox(height: 120,)
                  ],
                ),
              ),
            ),

            bottomSheet:
            controller.examCirculer.value ? LoadingWidget() :
            courseSectionContent!.writtenEndTime == null
                ? Container(
              height: 100,
            )
                : Container(
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
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: controller.questionResponse.value!.error == null && getTime(courseSectionContent!.writtenEndTime.toString()) == "Not late" ? 80 : 110,
              child: courseSectionContent!.writtenEndTime == null ? SizedBox() :
              Column(
                children: [
                  controller.questionResponse.value!.error == null &&  getTime(courseSectionContent!.writtenEndTime.toString()) ==
                      "Not late" ? SizedBox() :
                  Row(
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
                  controller.questionResponse.value!.error == null && getTime(courseSectionContent!.writtenEndTime.toString()) ==
                      "Not late" ? SizedBox() : SizedBox(height: 6,),

                  controller.questionResponse.value!.error == null && getTime(courseSectionContent!.writtenEndTime.toString()) ==
                      "Not late" ? SizedBox() :
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
                            //   'iswriitenExam': true,
                            //   "hasClassXm":courseSectionContent!.hasClassXm!.toInt()
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

                  SizedBox(height: 6,),
                  controller.questionResponse.value!.error == null && getTime(courseSectionContent!.writtenEndTime.toString()) ==
                      "Not late" ?
                  CustomButton(
                      color: AppColors.primaryColor,
                      height: 48,
                      width: 1.0.sw,
                      textColor: Colors.white,
                      borderRadius: 12,
                      title: "Start Exam",
                      onTap: () {
                        // Navigator.pushNamed(context, EXAM_PAGE, arguments: {
                        //   "id": courseSectionContent!.id.toString(),
                        //   "hasExam": courseSectionContent!.hasClassXm,
                        //   "isCourseExam": isCourseExam,
                        //   "iswriitenExam": true
                        // });
                        context.pushNamed(Routes.givenExamPage,extra:{
                            "id": courseSectionContent!.id.toString(),
                            "hasExam": courseSectionContent!.hasClassXm,
                            "isCourseExam": isCourseExam,
                            "iswriitenExam": true
                        });
                      }

                  ) : SizedBox(),

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
