import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../../data/models/Question/Option.dart';
import '../../data/models/Question/Question.dart';

class OptionCard extends StatelessWidget {
  final Option? option;
  final bool? showAnswer;
  final Question? question;
  final CourseProgressController? controller;
  final bool? isSelected;
  const OptionCard({Key? key, this.option, this.isSelected=false, this.question, this.controller, this.showAnswer=false, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      child: Row(
        children: [
          option!.optionImage==null?SizedBox():
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2,vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              decoration: BoxDecoration(
                  color:isSelected! ?AppColors.kPrimaryColorx: Colors.white,
                  border: Border.all(color: AppColors.kPrimaryColorx),
                  image: DecorationImage(
                    image: NetworkImage(ApiEndpoint.imageBaseUrl+option!.optionImage!.toString())
                  ),
                  borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0,vertical: 8),
              padding: EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                  color:showAnswer!&&option!.myAns!=null&&option!.myAns==1 ?Colors.green:showAnswer!&&option!.myAns!=null&&option!.myAns==0 ?Colors.redAccent: isSelected! ?showAnswer!?Colors.green:AppColors.kPrimaryColorx: Colors.white,
                  border: Border.all(color: AppColors.primarySlate100),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(option!.optionTitle??"",style: mediumText(12,color: isSelected!?Colors.white:AppColors.textClorColor),),
                      )),

                  Expanded(
                    flex:3,
                    child: Row(
                      children: [
                        showAnswer!?SizedBox():
                        isSelected!?
                        question!.isfixed!?SizedBox():
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                    onTap:(){
                                      question!.isfixed=true;
                                      controller!.optionSelect();
                                      print(question!.isfixed);
                                    },
                                    child: Container(
                                      height: 50,
                                        decoration: BoxDecoration(
                                            color:Colors.green,
                                            borderRadius: BorderRadius.circular(0)
                                        ),
                                        child: Icon(Icons.done,color: Colors.white,))
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                    onTap:(){
                                      question!.isfixed=false;
                                      question!.answer=null;
                                      controller!.optionSelect();
                                      print(question!.isfixed);
                                    },
                                    child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color:Colors.redAccent,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                            )
                                        ),
                                        child: Icon(Icons.close,color: Colors.white,))
                                ),
                              ),

                            ],
                          ),
                        ):
                        SizedBox(),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
