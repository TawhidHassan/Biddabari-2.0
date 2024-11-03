
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/util/text_style.dart';
import '../../data/models/Exam.dart';

class RankingCard extends StatelessWidget {
  final Exam? exam;
  final String? index;
  final num? examTime;
  const RankingCard({Key? key, this.exam, this.index,  this.examTime=100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: 1.0.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepOrangeAccent.withOpacity(0.30),
                ),
                child: Center(child: Text(index!,style: boldText(12,color: Colors.deepOrangeAccent),)),
              ),
              SizedBox(width: 12,),
              exam!.user!=null? Text(nameLenght(exam!.user!.name??"",16),style: boldText(12,color: Colors.deepOrangeAccent),):SizedBox(),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.timer,color: Colors.deepPurpleAccent,size: 12,),
                  Text((examTime!-exam!.requiredTime!).toString()+" Min".toString(),style: mediumText(11),)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.wine_bar_sharp,color: Colors.yellow,size: 12,),
                  exam!.courseSectionContent!=null? Text(exam!.resultMark.toString()+"/"+(int.parse(exam!.courseSectionContent!.examTotalQuestions??"0")*exam!.courseSectionContent!.examPerQuestionMark!).toString(),style: boldText(11,color: Colors.blueAccent),):SizedBox()
                ],
              ),
              Row(
                children: [
                  Text("Total Provided Answer: ",style: boldText(12,),),
                  Text(exam!.total_provided_ans.toString(),style: mediumText(11,color: AppColors.kPrimaryColorx),)
                ],
              ),
              Row(
                children: [
                  Text("Right Answer: ",style: boldText(12),),
                  Text(exam!.total_right_ans.toString(),style: mediumText(11,color:AppColors.kPrimaryColorx),)
                ],
              ),
              Row(
                children: [
                  Text("Wrong Answer: ",style: boldText(12),),
                  Text(exam!.total_wrong_ans.toString(),style: mediumText(11,color: AppColors.kPrimaryColorx),)
                ],
              ),
            ],
          ),
        ],
      ),

    );
  }

  String nameLenght(String? name,int? lenght){
    return name!.length>lenght!?name.substring(0,lenght-1)+"...":name;
  }
}
