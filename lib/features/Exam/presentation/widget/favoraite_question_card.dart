
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../../data/models/Question/Question.dart';
import 'option_card.dart';

class FavoraiteQuestionCard extends StatelessWidget {
  final Question? question;
  final CourseProgressController? controller;

  const FavoraiteQuestionCard({Key? key, this.question, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: (question!.isfixed == null || question!.isfixed == false)
                  ? AppColors.primarySlate100
                  : AppColors.kPrimaryColorx),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 12,
                child: Html(data: question!.question ?? ""),),
              Expanded(
                  flex: 1,
                  child: GetBuilder<CourseProgressController>(
                    assignId: true,
                    builder: (logic) {
                      return Obx(() {
                        return controller!.saveQuesCirculer.value?SizedBox():InkWell(
                            onTap: () {
                              controller!.removeQues(question!.id);
                            },
                            child: Icon(
                              Icons.favorite, color:  AppColors.kPrimaryColorx,));
                      });
                    },
                  ))
            ],
          ),
          question!.questionImage != null
              ? Image.network(
            ApiEndpoint.imageBaseUrl + question!.questionImage ?? "", height: 140,)
              : SizedBox(),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: question!.question_options!.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 1.0.sw,
                  child: Row(
                    children: [
                      question!.question_options![index].optionImage==null?SizedBox():
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2,vertical: 8),
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          decoration: BoxDecoration(
                            color:question!.question_options![index].isCorrect==1 ? AppColors.kPrimaryColorx: Colors.white,
                            border: Border.all(color:  AppColors.primarySlate50),
                            image: DecorationImage(
                                image: NetworkImage(ApiEndpoint.imageBaseUrl+question!.question_options![index]!.optionImage!.toString())
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          decoration: BoxDecoration(
                              color:question!.question_options![index].isCorrect==1  ?Colors.green:  Colors.white,
                              border: Border.all(color:  AppColors.primarySlate100),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(question!.question_options![index].optionTitle??"",style: mediumText(12),),
                        ),
                      ),

                    ],
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
