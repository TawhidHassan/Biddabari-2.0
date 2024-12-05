import 'dart:io';

import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/features/Exam/presentation/controller/Exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../widget/question_card.dart';
import '../widget/ranking_card.dart';


class SeeAnswerPage extends StatefulWidget {
  final String? id;
  final bool? isCourseExam;
  final bool? isClassExam;
  final bool? iswriitenExam;
  final num? hasClassXm;

  const SeeAnswerPage({super.key, this.id, this.isCourseExam, this.iswriitenExam=false, this.hasClassXm, this.isClassExam=false});

  @override
  State<SeeAnswerPage> createState() => _SeeAnswerPageState();
}

class _SeeAnswerPageState extends State<SeeAnswerPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      Get.find<CourseProgressController>().getExamAnswer(id: widget.id, isCourseExam: widget.isCourseExam,isClassExam: widget.isClassExam);
      Get.find<CourseProgressController>().getMyFavoraiteQuestion();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              context.pop();
              // Navigator.pop(context);
              Get.find<CourseProgressController>().getExamQuestions(
                  widget.id.toString(),
                 widget.hasClassXm!.toInt(), widget.isCourseExam!);
            },
            child: Padding(
                padding: EdgeInsets.all(18),
                child: Assets.icons.backArrow.svg())),
        title: Text("Answer"),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.circuler.value && controller.questionResponse.value==null?
              LoadingWidget():
              controller.questionResponse.value==null?LoadingWidget():
              controller.questionResponse.value!.error != null ?
              Center(child: Text(controller.questionResponse.value!.error!, style: boldText(14),),)
                  :
              widget.iswriitenExam!?
              Container(
                  child:controller.questionResponse.value!.writtenFile!=null?
                  PDF().cachedFromUrl(
                    ApiEndpoint.imageBaseUrl+(controller.questionResponse.value!.writtenFile??""),
                    placeholder: (double progress) => Center(child: Text('$progress %')),
                    errorWidget: (dynamic error) => Center(child: Text(error.toString())),
                  ):Center(child: Text("You Are Not Take This Exam", style: boldText(14),))):
              Column(
                children: [
                  controller.questionResponse.value!.myPosition!=null?
                  Expanded(
                    flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: RankingCard(
                          exam:  controller.questionResponse.value!.myPosition!,
                          examTime:controller.questionResponse.value!.content!.writtenExamDurationInMinutes!=null?
                         controller.questionResponse.value!.content!.writtenExamDurationInMinutes!.toString()
                              :controller.questionResponse.value!.content!.examDurationInMinutes==null?
                          controller.questionResponse.value!.content!.classExamDurationInMinutes.toString()
                              :controller.questionResponse.value!.content!.examDurationInMinutes.toString(),
                          index:"1",
                        ),
                      )
                  ):SizedBox(),
                  Expanded(
                      flex: 12,
                      child: Container(
                        child: ListView.builder(
                            itemCount:widget.isClassExam!?controller.questionResponse.value!.content!.questionStoresClassExam!.length: controller.questionResponse.value!.content!.questionStores!.length,
                            itemBuilder: (context, index) {
                              return QuestionCard(
                                controller: controller,
                                showAnswer: true,
                                question:widget.isClassExam!? controller.questionResponse.value!.content!.questionStoresClassExam![index]:controller.questionResponse.value!.content!.questionStores![index]
                              );
                            }
                        ),
                      )
                  )

                ],

              );
            });
          },
        ),
      ),
    );
  }
}
