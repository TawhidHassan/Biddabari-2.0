
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/Exam/presentation/controller/Exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';

import '../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/rank_user_top_card.dart';
import '../widget/ranking_card.dart';


class ExamRankingPage extends StatelessWidget {
  final String? id;
  final bool? isCourseExam;

  const ExamRankingPage({Key? key, this.id, this.isCourseExam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () {
      Get.find<ExamController>().getCourseExamRanking(id!.toString(),isCourseExam);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Ranking "),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: GetBuilder<ExamController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return
                controller.examResponse.value==null||
                    controller.examResponse.value!.courseExamResults==null||
                    controller.rankingCirculer.value?LoadingWidget():
                controller.examResponse.value!.courseExamResults!.isEmpty?EmptyWidget():
                Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          width: 1.0.sw,
                          margin: EdgeInsets.only(bottom: 26),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Assets.images.rankBg.provider(),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              // Row(
                              //   children: [
                              //     controller.examResponse.value!.courseExamResults!.length>1?
                              //     Expanded(
                              //       child: Container(
                              //         margin: EdgeInsets.only(right: 8),
                              //         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2 ),
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(8),
                              //             border: Border.all(color: AppColors.textClorColor.withOpacity(0.10)),
                              //             color: Colors.white
                              //         ),
                              //         child: Column(
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Image.asset("assets/images/madle2.png",height: 50,),
                              //             controller.examResponse.value!.courseExamResults![1].user==null? SizedBox()
                              //                 :Text(nameLenght(controller.examResponse.value!.courseExamResults![1].user!.name??"",7),
                              //               style: boldText(14,color: AppColors.kPrimaryColorx),),
                              //             Row(
                              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //               children: [
                              //                 Row(
                              //                   children: [
                              //                     Icon(Icons.timer,color: Colors.deepPurpleAccent,size: 12,),
                              //                     Text(
                              //                       ((controller.examResponse.value!.courseExamResults![1].courseSectionContent!.writtenExamDurationInMinutes!=null?
                              //                       controller.examResponse.value!.courseExamResults![1].courseSectionContent!.writtenExamDurationInMinutes??0
                              //                           :
                              //                       controller.examResponse.value!.courseExamResults![1].courseSectionContent!.examDurationInMinutes??0)- controller.examResponse.value!.courseExamResults![1].requiredTime!).toString()
                              //                           +"Min".toString(),style: mediumText(11),)
                              //                   ],
                              //                 ),
                              //                 Row(
                              //                   children: [
                              //                     Icon(Icons.wine_bar_sharp,color: Colors.yellow,size: 12,),
                              //                     Text(controller.examResponse.value!.courseExamResults![1].resultMark.toString()+"/"+(controller.examResponse.value!.courseExamResults![1].courseSectionContent!=null?(int.parse(controller.examResponse.value!.courseExamResults![1].courseSectionContent!.examTotalQuestions??"0")*controller.examResponse.value!.courseExamResults![1].courseSectionContent!.examPerQuestionMark!).toString():"0"),style: boldText(11,color: Colors.blueAccent),)
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ):
                              //     Expanded(child: SizedBox()),
                              //     controller.examResponse.value!.courseExamResults!.length>0?
                              //     Expanded(
                              //       child: Container(
                              //         margin: EdgeInsets.only(right: 8),
                              //         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2 ),
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(8),
                              //             border: Border.all(color: AppColors.textClorColor.withOpacity(0.10)),
                              //             color: Colors.white
                              //         ),
                              //         child: Column(
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             SizedBox(height: 4,),
                              //             Assets.images.fram.image(),
                              //             controller.examResponse.value!.courseExamResults![0].user==null? SizedBox()
                              //                 :Text(nameLenght(controller.examResponse.value!.courseExamResults![0].user!.name,7),
                              //               style: boldText(14,color: AppColors.kPrimaryColorx),),
                              //
                              //             Row(
                              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //               children: [
                              //                 Row(
                              //                   children: [
                              //                     Icon(Icons.timer,color: Colors.deepPurpleAccent,size: 12,),
                              //                     Text(((controller.examResponse.value!.courseExamResults![0].courseSectionContent!.writtenExamDurationInMinutes!=null?
                              //                     controller.examResponse.value!.courseExamResults![0].courseSectionContent!.writtenExamDurationInMinutes??0
                              //                         :
                              //                     controller.examResponse.value!.courseExamResults![0].courseSectionContent!.examDurationInMinutes??0)-controller.examResponse.value!.courseExamResults![0].requiredTime!).toString()
                              //                         +
                              //                         "Min".toString(),style: mediumText(11),)
                              //                   ],
                              //                 ),
                              //                 Row(
                              //                   children: [
                              //                     Icon(Icons.wine_bar_sharp,color: Colors.yellow,size: 12,),
                              //                     Text(controller.examResponse.value!.courseExamResults![0].resultMark.toString()+"/"+(controller.examResponse.value!.courseExamResults![0].courseSectionContent!=null?(int.parse(controller.examResponse.value!.courseExamResults![0].courseSectionContent!.examTotalQuestions??"0")*controller.examResponse.value!.courseExamResults![0].courseSectionContent!.examPerQuestionMark!).toString():"0"),style: boldText(11,color: Colors.blueAccent),)
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ):
                              //     Expanded(child: SizedBox()),
                              //     controller.examResponse.value!.courseExamResults!.length>2?
                              //     Expanded(
                              //       child: Container(
                              //         margin: EdgeInsets.only(right: 8),
                              //         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2 ),
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(8),
                              //             border: Border.all(color: AppColors.textClorColor.withOpacity(0.10)),
                              //             color: Colors.white
                              //         ),
                              //         child: Column(
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Image.asset("assets/images/madle3.png",height: 50,),
                              //             controller.examResponse.value!.courseExamResults![2].user==null? SizedBox()
                              //                 :Text(nameLenght(controller.examResponse.value!.courseExamResults![2].user!.name??"",7),
                              //               style: boldText(14,color: AppColors.kPrimaryColorx),),
                              //             Row(
                              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //               children: [
                              //                 Row(
                              //                   children: [
                              //                     Icon(Icons.timer,color: Colors.deepPurpleAccent,size: 12,),
                              //                     Text(
                              //                       ((controller.examResponse.value!.courseExamResults![2].courseSectionContent!.writtenExamDurationInMinutes!=null?
                              //                       controller.examResponse.value!.courseExamResults![2].courseSectionContent!.writtenExamDurationInMinutes??0
                              //                           :
                              //                       controller.examResponse.value!.courseExamResults![2].courseSectionContent!.examDurationInMinutes??0)-controller.examResponse.value!.courseExamResults![2].requiredTime!).toString()
                              //
                              //                           +"Min".toString(),
                              //                       style: mediumText(11),)
                              //                   ],
                              //                 ),
                              //                 Row(
                              //                   children: [
                              //                     Icon(Icons.wine_bar_sharp,color: Colors.yellow,size: 12,),
                              //                     Text(controller.examResponse.value!.courseExamResults![2].resultMark.toString()+"/"+(controller.examResponse.value!.courseExamResults![2].courseSectionContent!=null?(int.parse(controller.examResponse.value!.courseExamResults![2].courseSectionContent!.examTotalQuestions??"0")*controller.examResponse.value!.courseExamResults![2].courseSectionContent!.examPerQuestionMark!).toString():"0"),style: boldText(11,color: Colors.blueAccent),)
                              //                   ],
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ):
                              //     Expanded(child: SizedBox()),
                              //
                              //   ],
                              // ),

                              controller.examResponse.value!.courseExamResults!.length>0?
                              Positioned(
                                top: 25,
                                child: RankUserTopCard(
                                  exam: controller.examResponse.value!.courseExamResults![0],
                                ),
                              ):SizedBox(),
                              controller.examResponse.value!.courseExamResults!.length>1?
                              Positioned(
                                top: 45.h,
                                left: 65.w,
                                child: RankUserTopCard(
                                  exam: controller.examResponse.value!.courseExamResults![1],
                                ),
                              ):SizedBox(),

                              controller.examResponse.value!.courseExamResults!.length>2?
                              Positioned(
                                top: 60.h,
                                right: 69.w,
                                child: RankUserTopCard(
                                  exam: controller.examResponse.value!.courseExamResults![2],
                                ),
                              ):SizedBox(),

                              Assets.images.posiutionImage.image(),
                            ],
                          ),
                        )
                    ),
                    Expanded(
                        flex: 8,
                        child: ListView.builder(
                          itemCount: controller.examResponse.value!.courseExamResults!.length,
                          itemBuilder: (context,index){
                            return  RankingCard(
                              exam: controller.examResponse.value!.courseExamResults![index],
                              examTime:controller.examResponse.value!.courseExamResults![index].courseSectionContent!.writtenExamDurationInMinutes!=null?
                              controller.examResponse.value!.courseExamResults![index].courseSectionContent!.writtenExamDurationInMinutes??0
                                  :
                              controller.examResponse.value!.courseExamResults![index].courseSectionContent!.examDurationInMinutes??0,
                              index:(index+1).toString(),
                            );
                          },
                        )
                    ),
                  ],
                );
            });
          },
        ),
      ),
    );
  }

  String nameLenght(String? name,int? lenght){


    return name!.length>lenght!?name.substring(0,lenght-1)+"...":name;
  }

}
