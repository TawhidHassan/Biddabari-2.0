
import 'package:biddabari_new/core/common/widgets/container/discount_badge.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/CourseProgress/presentation/pages/course%20show/exam_question_pdf_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:logger/logger.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../../data/models/Question/Question.dart';
import 'option_card.dart';

class QuestionCard extends StatefulWidget {
  final Question? question;
  final bool? showAnswer;
  final CourseProgressController? controller;

  const QuestionCard({Key? key, this.question, this.controller, this.showAnswer=false})
      : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {

  bool? showAnswer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showAnswer=false;
  }

  @override
  Widget build(BuildContext context) {
    // Logger().w(controller!.questionSaveResponse.value!.questions!.where((element) => element.id==question!.id).first);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
          color:widget.question!.question_options!.where((element) => element.myAns==element.isCorrect).isNotEmpty? Colors.yellowAccent.withAlpha(16):Colors.transparent,
          border: Border.all(
              color: (widget.question!.isfixed == null || widget.question!.isfixed == false)
                  ? AppColors.primarySlate100
                  : AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: Html(data: widget.question!.question ?? "",shrinkWrap: true,),),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      GetBuilder<CourseProgressController>(
                        assignId: true,
                        builder: (logic) {
                          return Obx(() {
                            return widget.controller!.saveQuesCirculer.value?SizedBox(child: CircularProgressIndicator(),):
                            InkWell(
                                onTap: () {
                                  print(ApiEndpoint.imageBaseUrl + widget.question!.questionImage);
                                  if( widget.controller!.questionSaveResponse.value!.questions!.where((element) => element.question_store_id==widget.question!.id).isNotEmpty){
                                    widget.controller!.removeQues(widget.question!.id);
                                  }else{
                                    widget.controller!.saveQues(widget.question!.id);
                                  }

                                },
                                child: Icon(
                                  widget.controller!.questionSaveResponse.value!.questions!.where((element) => element.question_store_id==widget.question!.id).isNotEmpty?
                                Icons.favorite:Icons.favorite_outline, color: AppColors.primaryColor,));
                          });
                        },
                      ),
                    ],
                  ))
            ],
          ),
          widget.question!.questionImage != null
              ?
          widget.question!.questionImage!.toString().contains(".pdf")?
          InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamQuestionPdfShow(
                    url:  ApiEndpoint.imageBaseUrl + widget.question!.questionImage!,
                      courseSectionContent:widget.controller!.slectCouserContentForExamPdf.value)),
                );
              },
              child: Text("Click to See Exam Pdf Question!",style: boldText(18,color: Colors.blue),)):
          Image.network(
            ApiEndpoint.imageBaseUrl + widget.question!.questionImage!)
              :
          SizedBox(),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.question!.question_options!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (!widget.question!.isfixed!) {
                        widget.question!.answer =
                            widget.question!.question_options![index].id!.toString();
                        widget.controller?.optionSelect();
                      }
                    },
                    child: OptionCard(
                      showAnswer: widget.showAnswer,
                        isSelected:widget.showAnswer!?widget.question!.question_options![index].isCorrect==1 :widget.question!.answer ==
                            widget.question!.question_options![index].id.toString(),
                        question: widget.question,
                        controller: widget.controller,
                        option: widget.question!.question_options![index])
                );
              }
          ),


          // showAnswer?
          widget.question!.mcq_ans_description==null?
              Text("")
              :
          InkWell(
              onTap: (){
                setState(() {
                  if(showAnswer!){
                    showAnswer=false;
                  }else{
                    showAnswer=true;
                  }

                });
              },
              child: Text("See answer details",style: boldText(14,color: Colors.blueAccent),)),

          showAnswer!?
          Html(
          data: widget.question!.mcq_ans_description??""
          ):SizedBox()
          //     :
          // SizedBox()
        ],
      ),
    );
  }
}
